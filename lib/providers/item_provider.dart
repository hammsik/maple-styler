import 'package:maple_closet/database/database.dart';
import 'package:maple_closet/models/item.dart';
import 'package:maple_closet/models/tool.dart';
import 'package:maple_closet/providers/setting_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'item_provider.g.dart';

@Riverpod(keepAlive: true)
class MapleItemList extends _$MapleItemList {
  @override
  Future<Map<ToolType, Map<SubCategoryType, List<dynamic>>>> build() async {
    print('으아악 아이템 리스트가 전역 provider로 빌드됐다다아아');
    return loadItemList(ItemDatabase());
  }

  Future<Map<ToolType, Map<SubCategoryType, List<dynamic>>>> loadItemList(
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

    for (final subCategory
        in toolMap[ToolType.weapon]!.subCategoryMap!.values) {
      final List<WeaponItem> items =
          await (itemDatabase.select(itemDatabase.weaponItems)
                ..where((item) => item.subCategory.equals(subCategory.nameEn)))
              .get();
      weaponItemMap[subCategory.type] = items
          .map((item) => ItemConverter.itemFromDatabase(item))
          .toList()
          .reversed
          .toList();
    }

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
