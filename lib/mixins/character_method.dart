// ignore_for_file: curly_braces_in_flow_control_structures

import 'package:maple_closet/models/equipment.dart';
import 'package:maple_closet/models/item.dart';
import 'package:maple_closet/models/skeleton_tools.dart';

mixin CharacterMethod {
  Equipment copyWithSubCategoryType({
    required Equipment equipment,
    required SubCategoryType subCategoryType,
    Item? item,
  }) {
    switch (subCategoryType) {
      // 뷰티
      case SubCategoryType.hair:
        return equipment.copyWith(hair: item);
      case SubCategoryType.face:
        return equipment.copyWith(face: item);
      case SubCategoryType.head:
        // head를 벗기는 경우는 없음
        return equipment.copyWith(head: item!);
      // 장비
      case SubCategoryType.hat:
        return equipment.copyWith(hat: item);
      case SubCategoryType.overall:
        return equipment.copyWith(overAll: item);
      case SubCategoryType.cash:
        return equipment.copyWith(cash: item);
      case SubCategoryType.top:
        return equipment.copyWith(top: item, overAll: null);
      case SubCategoryType.bottom:
        return equipment.copyWith(bottom: item, overAll: null);
      case SubCategoryType.cape:
        return equipment.copyWith(cape: item);
      case SubCategoryType.glove:
        return equipment.copyWith(glove: item);
      case SubCategoryType.shoes:
        return equipment.copyWith(shoes: item);
      case SubCategoryType.shield:
        return equipment.copyWith(shield: item);
      // 악세
      case SubCategoryType.faceAccessory:
        return equipment.copyWith(faceAccessory: item);
      case SubCategoryType.eyeDecoration:
        return equipment.copyWith(eyeDecoration: item);
      case SubCategoryType.earrings:
        return equipment.copyWith(earrings: item);
      default:
        return equipment;
    }
  }

  String addVersionAndRegion(String item) {
    return '{"itemId":$item, "version":"389","region":"KMS"},';
  }

  List<String> makeCharacterUrl(Equipment e) {
    String url = addVersionAndRegion(e.head.id) +
        addVersionAndRegion(e.head.id.substring(1));
    if (e.hat != null) url += addVersionAndRegion(e.hat!.id);
    if (e.cash != null) url += addVersionAndRegion(e.cash!.id);
    if (e.cape != null) url += addVersionAndRegion(e.cape!.id);
    if (e.glove != null) url += addVersionAndRegion(e.glove!.id);
    if (e.shoes != null) url += addVersionAndRegion(e.shoes!.id);
    if (e.shield != null) url += addVersionAndRegion(e.shield!.id);
    if (e.faceAccessory != null)
      url += addVersionAndRegion(e.faceAccessory!.id);
    if (e.eyeDecoration != null)
      url += addVersionAndRegion(e.eyeDecoration!.id);
    if (e.earrings != null) url += addVersionAndRegion(e.earrings!.id);

    // 한벌옷을 입었을 경우에는 한벌옷만 추가, 아니면 상하의 추가
    if (e.overAll != null) {
      url += addVersionAndRegion(e.overAll!.id);
    } else {
      // 상, 하의를 입지 않았을 경우에는 기본 속옷 추가
      if (e.top != null)
        url += addVersionAndRegion(e.top!.id);
      else
        url += addVersionAndRegion('1040036');

      if (e.bottom != null)
        url += addVersionAndRegion(e.bottom!.id);
      else
        url += addVersionAndRegion('1060026');
    }

    // 뷰티
    String beauty1 = '';
    String beauty2 = '';
    if (e.hair != null) {
      beauty1 =
          addVersionAndRegion(e.hair!.id.replaceRange(4, 5, e.hairColor1));
      beauty2 =
          addVersionAndRegion(e.hair!.id.replaceRange(4, 5, e.hairColor2));
    }
    if (e.face != null) {
      beauty1 +=
          addVersionAndRegion(e.face!.id.replaceRange(2, 3, e.lensColor1));
      beauty2 +=
          addVersionAndRegion(e.face!.id.replaceRange(2, 3, e.lensColor2));
    }

    return [url + beauty1, url + beauty2];
  }
}
