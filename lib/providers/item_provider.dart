import 'package:maple_closet/data/my_tools.dart';
import 'package:maple_closet/database/database.dart';
import 'package:maple_closet/models/item.dart';
import 'package:maple_closet/models/tool.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'item_provider.g.dart';

@Riverpod(keepAlive: true)
class MapleItemList extends _$MapleItemList {
  @override
  Future<List<List<List<Item>>>> build() async {
    print('으아악 아이템 리스트가 전역 provider로 빌드됐다다아아');
    return loadItemList(ItemDatabase());
  }

  Future<List<List<List<Item>>>> loadItemList(ItemDatabase itemDatabase) async {
    final List<List<Item>> characterItemList = [];
    final List<List<Item>> armorItemList = [];
    final List<List<Item>> accessoryItemList = [];

    print('아이템 리스트 로딩중...');

    for (final subCategory in toolMap[ToolType.beauty]!.subCategoryList!) {
      final List<CharacterItem> items =
          await (itemDatabase.select(itemDatabase.characterItems)
                ..where((item) => item.subCategory.equals(subCategory.nameEn)))
              .get();
      characterItemList.add(
        items
            .map((item) => ItemConverter.itemFromDatabase(item))
            .toList()
            .reversed
            .toList(),
      );
    }

    print('characterItemList: ${characterItemList.length}');

    for (final subCategory in toolMap[ToolType.armor]!.subCategoryList!) {
      final List<ArmorItem> items =
          await (itemDatabase.select(itemDatabase.armorItems)
                ..where((item) => item.subCategory.equals(subCategory.nameEn)))
              .get();
      armorItemList.add(
        items
            .map((item) => ItemConverter.itemFromDatabase(item))
            .toList()
            .reversed
            .toList(),
      );
    }

    print('armorItemList: ${armorItemList.length}');

    for (final subCategory in toolMap[ToolType.accessory]!.subCategoryList!) {
      final List<AccessoryItem> items =
          await (itemDatabase.select(itemDatabase.accessoryItems)
                ..where((item) => item.subCategory.equals(subCategory.nameEn)))
              .get();
      accessoryItemList.add(
        items
            .map((item) => ItemConverter.itemFromDatabase(item))
            .toList()
            .reversed
            .toList(),
      );
    }

    print('accessoryItemList: ${accessoryItemList.length}');

    return [characterItemList, armorItemList, accessoryItemList];
  }
}
