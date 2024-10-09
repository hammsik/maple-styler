import 'package:maple_closet/data/color_palette.dart';
import 'package:maple_closet/models/item.dart';
import 'package:maple_closet/models/equipment.dart';
import 'package:maple_closet/models/skeleton_tools.dart';
import 'package:maple_closet/mixins/character_method.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'character_provider.g.dart';

// 앱 전역에서 수시로 사용되므로 keepAlive: true로 설정
@Riverpod(keepAlive: true)
class CharacterProvider extends _$CharacterProvider with CharacterMethod {
  @override
  Equipment build() {
    return const Equipment(
      hairColor1: '0',
      hairColor2: '0',
      lensColor1: '0',
      lensColor2: '0',
      head: Item(id: '12016', name: '홍조 꽃잎 피부'),
      // body없는 이유는 head에서 substring(1)만 하면 되므로... 이거 toJson에도 반영을 해야함..
    );
  }

  /// item: null인 경우는 아이템 장착 해제
  void updateEquipment({
    required SubCategoryType subCategoryType,
    Item? item,
  }) {
    state = copyWithSubCategoryType(
      equipment: state,
      subCategoryType: subCategoryType,
      item: item,
    );
  }

  void updateHairColor({
    required HairColor hairColor1,
    required HairColor hairColor2,
  }) {
    state = state.copyWith(
      hairColor1: convertHairColorKeyToString(hairColor: hairColor1),
      hairColor2: convertHairColorKeyToString(hairColor: hairColor2),
    );
  }

  void updateLensColor({
    required LensColor lensColor1,
    required LensColor lensColor2,
  }) {
    state = state.copyWith(
      lensColor1: convertLensColorKeyToString(lensColor: lensColor1),
      lensColor2: convertLensColorKeyToString(lensColor: lensColor2),
    );
  }
}
