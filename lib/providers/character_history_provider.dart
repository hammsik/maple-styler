import 'package:maple_closet/mixins/character_method.dart';
import 'package:maple_closet/models/character_history.dart';
import 'package:maple_closet/models/equipment.dart';
import 'package:maple_closet/providers/character_equipment_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'character_history_provider.g.dart';

@Riverpod(keepAlive: true)
class CharacterHistory extends _$CharacterHistory with CharacterMethod {
  @override
  History build() {
    // 초기 상태로 equipment가 하나 들어있는 History를 생성합니다.
    return History(
      equipmentsList: [
        ref.watch(characterEquipmentProvider).copyWith(),
      ],
      maxHistoryLength: 10,
    );
  }

  void addCharacterHistory(Equipment equipment) {
    // 만약 현재 historyIndex가 마지막 index가 아니라면, 현재 index 이후의 항목을 제거하고 새로운 항목을 추가합니다.
    // 그렇지 않다면, 가장 오래된 항목을 제거하고 새로운 항목을 추가합니다.
    List<Equipment> updatedEquipmentsList;
    if (state.historyIndex < state.equipmentsList.length - 1) {
      updatedEquipmentsList = state.equipmentsList
          .sublist(0, state.historyIndex + 1)
        ..add(equipment);
    } else {
      updatedEquipmentsList = state.equipmentsList.sublist(1)..add(equipment);
    }

    state = state.copyWith(
      equipmentsList: updatedEquipmentsList,
      historyIndex: updatedEquipmentsList.length - 1,
    );
  }

  void undo() {
    // 코디를 이전 상태로 되돌립니다.
    if (state.historyIndex > 0) {
      state = state.copyWith(historyIndex: state.historyIndex - 1);
    }
  }

  void redo() {
    // 코디를 다음 상태로 되돌립니다.
    if (state.historyIndex < state.equipmentsList.length - 1) {
      state = state.copyWith(historyIndex: state.historyIndex + 1);
    }
  }

  List<String> getCurrentCharacterImageUrl() {
    // 현재 코디의 이미지 URL 2개를 반환합니다.
    List<String> itemsBodyList =
        state.equipmentsList[state.historyIndex].makeCharacterItemsBody();
    return [
      'https://maplestory.io/api/Character/${itemsBodyList[0]}/stand1/animated',
      'https://maplestory.io/api/Character/${itemsBodyList[1]}/stand1/animated'
    ];
  }
}
