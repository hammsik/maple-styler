import 'package:maple_closet/models/item.dart';
import 'package:maple_closet/models/equipment.dart';
import 'package:maple_closet/models/skeleton_tools.dart';
import 'package:maple_closet/providers/character_method.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'character_provider.g.dart';

// 앱 전역에서 수시로 사용되므로 keepAlive: true로 설정
@Riverpod(keepAlive: true)
class CharacterProvider extends _$CharacterProvider {
  @override
  Equipment build() {
    return const Equipment(
      head: Item(id: '12016', name: '홍조 꽃잎 피부'),
    );
  }

  void updateEquipment(
      {required SubCategoryType subCategoryType, required Item item}) {
    state = copyWithSubCategoryType(
      equipment: state,
      subCategoryType: subCategoryType,
      item: item,
    );
  }

  void takeOffEquipment({required SubCategoryType subCategoryType}) {
    state = copyWithSubCategoryType(
      equipment: state,
      subCategoryType: subCategoryType,
      item: null,
    );
  }
}
