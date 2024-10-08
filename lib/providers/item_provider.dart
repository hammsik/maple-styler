import 'package:maple_closet/data/my_tools.dart';
import 'package:maple_closet/database/database.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'item_provider.g.dart';

@Riverpod(keepAlive: true)
class MapleItemList extends _$MapleItemList {
  @override
  Future<List<List<List<dynamic>>>> build() async {
    print('으아악 빌드됐다다아아 ');
    return loadItemList(ItemDatabase());
  }

  Future<List<List<List<dynamic>>>> loadItemList(ItemDatabase itemDatabase) async {
    List<List<List<dynamic>>> itemList = [];

    List<List<CharacterItem>> characterItemList = [];
    List<List<ArmorItem>> armorItemList = [];
    List<List<AccessoryItem>> accessoryItemList = [];

    for (final subCategory in myToolList[0].subCategoryList!) {
      characterItemList.add(List.from((await(
                  itemDatabase.select(itemDatabase.characterItems)
                    ..where((item) => item.subCategory.equals(subCategory.nameEn)))
              .get())
          .reversed));
    }

    for (final subCategory in myToolList[1].subCategoryList!) {
      armorItemList.add(List.from((await(itemDatabase.select(itemDatabase.armorItems)
                ..where((item) => item.subCategory.equals(subCategory.nameEn)))
            .get())
        .reversed));
    }

    for (final subCategory in myToolList[2].subCategoryList!) {
      accessoryItemList.add(List.from((await(
                  itemDatabase.select(itemDatabase.accessoryItems)
                    ..where((item) => item.subCategory.equals(subCategory.nameEn)))
              .get())
          .reversed));
    }

    itemList.add(characterItemList);
    itemList.add(armorItemList);
    itemList.add(accessoryItemList);

    return itemList;
  }
}