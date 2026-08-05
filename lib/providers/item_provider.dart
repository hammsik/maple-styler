import 'package:drift/drift.dart';
import 'package:maple_closet/database/database.dart';
import 'package:maple_closet/models/item.dart';
import 'package:maple_closet/models/tool.dart';
import 'package:maple_closet/providers/setting_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'item_provider.g.dart';

@Riverpod(keepAlive: true)
class MapleItemList extends _$MapleItemList {
  @override
  Future<Map<ToolType, Map<SubCategoryType, List<Item>>>> build() async {
    print('으아악 아이템 리스트가 전역 provider로 빌드됐다다아아');
    return loadItemList(ItemDatabase());
  }

  Future<Map<ToolType, Map<SubCategoryType, List<Item>>>> loadItemList(
      ItemDatabase itemDatabase) async {
    final Map<ToolType, MyTool> toolMap = ref.read(toolMapProvider);

    final Map<SubCategoryType, List<Item>> characterItemMap = {};
    final Map<SubCategoryType, List<Item>> armorItemMap = {};
    final Map<SubCategoryType, List<Item>> weaponItemMap = {};
    final Map<SubCategoryType, List<Item>> accessoryItemMap = {};

    print('아이템 리스트 로딩중...');

    for (final subCategory
        in toolMap[ToolType.beauty]!.subCategoryMap!.values) {
      final List<CharacterItem> items =
          await (itemDatabase.select(itemDatabase.characterItems)
                ..where((item) => item.subCategory.equals(subCategory.nameEn)))
              .get();
      characterItemMap[subCategory.type] = items
          .map((item) => ItemConverter.itemFromDatabase(item))
          .toList()
          .reversed
          .toList();
    }

    print(
        'characterItemMap: ${characterItemMap.values.map((e) => '${e.length}')}');

    for (final subCategory in toolMap[ToolType.armor]!.subCategoryMap!.values) {
      final List<ArmorItem> items =
          await (itemDatabase.select(itemDatabase.armorItems)
                ..where((item) => item.subCategory.equals(subCategory.nameEn)))
              .get();
      armorItemMap[subCategory.type] = items
          .map((item) => ItemConverter.itemFromDatabase(item))
          .toList()
          .reversed
          .toList();
    }

    print('armorItemMap: ${armorItemMap.values.map((e) => '${e.length}')}');

    for (final subCategory in toolMap[ToolType.weapon]!.subCategoryMap!.values) {
      // weapon_items.sub_category 포맷:
      //  - 캐시무기: 'Cash' (평면) -> nameEn과 정확히 일치
      //  - 한/두손무기: 'One-Handed Weapon/One-Handed Sword' (계층)
      //    -> nameEn('One-Handed Weapon')으로 시작하는 모든 세부 무기를 가져온다.
      //    세부 분류(Child)는 각 Item.weaponCategory에 담겨 UI 필터에서 사용된다.
      final query = itemDatabase.select(itemDatabase.weaponItems);
      if (subCategory.type == SubCategoryType.cash) {
        query.where((item) => item.subCategory.equals(subCategory.nameEn));
      } else {
        query.where((item) => item.subCategory.like('${subCategory.nameEn}/%'));
      }
      final List<WeaponItem> items = await query.get();
      weaponItemMap[subCategory.type] = items
          .map((item) => ItemConverter.itemFromDatabase(item))
          .toList()
          .reversed
          .toList();
    }

    print('weaponItemMap: ${weaponItemMap.values.map((e) => '${e.length}')}');

    for (final subCategory
        in toolMap[ToolType.accessory]!.subCategoryMap!.values) {
      final List<AccessoryItem> items =
          await (itemDatabase.select(itemDatabase.accessoryItems)
                ..where((item) => item.subCategory.equals(subCategory.nameEn)))
              .get();
      accessoryItemMap[subCategory.type] = items
          .map((item) => ItemConverter.itemFromDatabase(item))
          .toList()
          .reversed
          .toList();
    }

    print(
        'accessoryItemMap: ${accessoryItemMap.values.map((e) => '${e.length}')}');

    return {
      ToolType.beauty: characterItemMap,
      ToolType.armor: armorItemMap,
      ToolType.weapon: weaponItemMap,
      ToolType.accessory: accessoryItemMap,
    };
  }
}
