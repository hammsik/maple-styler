import 'dart:typed_data';

import 'package:maple_closet/mixins/character_method.dart';
import 'package:maple_closet/models/character_history.dart';
import 'package:maple_closet/models/equipment.dart';
import 'package:maple_closet/providers/api_provider.dart';
import 'package:maple_closet/providers/character_equipment_provider.dart';
import 'package:maple_closet/providers/setting_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'character_history_provider.g.dart';

@Riverpod(keepAlive: true)
class CharacterHistory extends _$CharacterHistory with CharacterMethod {
  @override
  History build() {
    // 초기 상태로 equipment가 하나 들어있는 History를 생성합니다.
    print('CharacterHistory build');
    return History(
      equipmentsList: [
        ref.read(characterEquipmentProvider).copyWith(),
      ],
      maxHistoryLength: 10,
    );
  }

  void addCharacterHistory(Equipment equipment) {
    List<Equipment> updatedEquipmentsList = [...state.equipmentsList];

    // 만약 현재 historyIndex가 마지막 index가 아니라면, 현재 index 이후의 항목을 제거합니다.
    if (state.historyIndex < state.equipmentsList.length - 1) {
      updatedEquipmentsList =
          updatedEquipmentsList.sublist(0, state.historyIndex + 1);
    } else if (state.equipmentsList.length == state.maxHistoryLength) {
      // 그렇지 않다면, max길이에 도달했을 때만 가장 오래된 항목만 제거합니다.
      updatedEquipmentsList = updatedEquipmentsList.sublist(1);
    }

    // 새로운 항목을 추가합니다.
    updatedEquipmentsList.add(equipment);
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

  Future<List<Uint8List>> getCurrentCharacterImageByUint() {
    List<String> itemsBodyList =
        state.equipmentsList[state.historyIndex].makeCharacterItemsBodyPair();

    List<String> standUrls = [
      'https://maplestory.io/api/Character/${itemsBodyList[0]}/stand1/0?bgColor=230,222,218,255',
      'https://maplestory.io/api/Character/${itemsBodyList[1]}/stand1/0?bgColor=230,222,218,255',
    ];
    List<String> standGifUrls = [
      'https://maplestory.io/api/Character/${itemsBodyList[0]}/stand1/animated?bgColor=230,222,218,255',
      'https://maplestory.io/api/Character/${itemsBodyList[1]}/stand1/animated?bgColor=230,222,218,255',
    ];
    List<String> walkGifUrls = [
      'https://maplestory.io/api/Character/${itemsBodyList[0]}/walk1/animated?bgColor=230,222,218,255',
      'https://maplestory.io/api/Character/${itemsBodyList[1]}/walk1/animated?bgColor=230,222,218,255',
    ];

    switch (ref.read(imageSettingProvider)) {
      case ImageType.stand:
        return ref.read(apiProvider.notifier).getCharacterImage(standUrls);
      case ImageType.standGif:
        return ref.read(apiProvider.notifier).getCharacterImage(standGifUrls);
      case ImageType.walkGif:
        return ref.read(apiProvider.notifier).getCharacterImage(walkGifUrls);
    }
  }

  List<String> getCurrentCharacterImageUrl() {
    // 현재 코디의 이미지 URL 2개를 반환합니다.
    List<String> itemsBodyList =
        state.equipmentsList[state.historyIndex].makeCharacterItemsBodyPair();

    switch (ref.read(imageSettingProvider)) {
      case ImageType.stand:
        return [
          'https://maplestory.io/api/Character/${itemsBodyList[0]}/stand1/0?bgColor=230,222,218,255',
          'https://maplestory.io/api/Character/${itemsBodyList[1]}/stand1/0?bgColor=230,222,218,255',
        ];
      case ImageType.standGif:
        return [
          'https://maplestory.io/api/Character/${itemsBodyList[0]}/stand1/animated?bgColor=230,222,218,255',
          'https://maplestory.io/api/Character/${itemsBodyList[1]}/stand1/animated?bgColor=230,222,218,255',
        ];
      case ImageType.walkGif:
        return [
          'https://maplestory.io/api/Character/${itemsBodyList[0]}/walk1/animated?bgColor=230,222,218,255',
          'https://maplestory.io/api/Character/${itemsBodyList[1]}/walk1/animated?bgColor=230,222,218,255',
          'https://maplestory.io/api/Character/${itemsBodyList[0]}/walk1/animated?bgColor=230,222,218,255',
          'https://maplestory.io/api/Character/${itemsBodyList[1]}/walk1/animated?bgColor=230,222,218,255',
          'https://maplestory.io/api/Character/${itemsBodyList[0]}/walk1/animated?bgColor=230,222,218,255',
          'https://maplestory.io/api/Character/${itemsBodyList[1]}/walk1/animated?bgColor=230,222,218,255',
        ];
    }
  }
}
