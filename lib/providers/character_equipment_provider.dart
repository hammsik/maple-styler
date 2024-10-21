import 'package:maple_closet/data/color_palette.dart';
import 'package:maple_closet/models/item.dart';
import 'package:maple_closet/models/equipment.dart';
import 'package:maple_closet/models/tool.dart';
import 'package:maple_closet/mixins/character_method.dart';
import 'package:maple_closet/providers/character_history_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'character_equipment_provider.g.dart';

// 앱 전역에서 수시로 사용되므로 keepAlive: true로 설정
@Riverpod(keepAlive: true)
class CharacterEquipment extends _$CharacterEquipment with CharacterMethod {
  @override
  Equipment build() {
    return const Equipment(
      hairColor1: HairColor.black,
      hairColor2: HairColor.black,
      lensColor1: LensColor.black,
      lensColor2: LensColor.black,
      head: Item(
          id: '12016', name: '홍조 꽃잎 피부', subCategoryType: SubCategoryType.head),
      // body없는 이유는 head에서 substring(1)만 하면 되므로... 이거 toJson에도 반영을 해야함..
    );
  }

  void updateEquipment({
    required Item item,
  }) {
    state = copyWithSubCategoryType(
      equipment: state,
      subCategoryType: item.subCategoryType,
      item: item,
    );

    // 캐릭터 장비 변경 이력 추가
    ref
        .read(characterHistoryProvider.notifier)
        .addCharacterHistory(state.copyWith());
  }

  void takeOffEquipment({
    required SubCategoryType subCategoryType,
  }) {
    state = copyWithSubCategoryType(
      equipment: state,
      subCategoryType: subCategoryType,
      item: null,
    );

    // 캐릭터 장비 변경 이력 추가
    ref
        .read(characterHistoryProvider.notifier)
        .addCharacterHistory(state.copyWith());
  }

  void updateHairColor({
    required HairColor hairColor1,
    required HairColor hairColor2,
  }) {
    state = state.copyWith(
      hairColor1: hairColor1,
      hairColor2: hairColor2,
    );

    // 캐릭터 장비 변경 이력 추가
    ref
        .read(characterHistoryProvider.notifier)
        .addCharacterHistory(state.copyWith());
  }

  void updateLensColor({
    required LensColor lensColor1,
    required LensColor lensColor2,
  }) {
    state = state.copyWith(
      lensColor1: lensColor1,
      lensColor2: lensColor2,
    );

    // 캐릭터 장비 변경 이력 추가
    ref
        .read(characterHistoryProvider.notifier)
        .addCharacterHistory(state.copyWith());
  }
}
