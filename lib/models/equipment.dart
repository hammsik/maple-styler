// ignore_for_file: curly_braces_in_flow_control_structures

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:maple_closet/models/item.dart';
import 'package:maple_closet/models/skeleton_tools.dart';

part 'equipment.freezed.dart';
part 'equipment.g.dart';

// 코디 아이템을 모아놓은 맵
@freezed
class Equipment with _$Equipment {
  const factory Equipment({
    required String hairColor1,
    required String hairColor2,
    required String lensColor1,
    required String lensColor2,
    // 뷰티
    @Default(
        Item(id: '68090', name: '허쉬 헤어', subCategoryType: SubCategoryType.hair))
    Item? hair,
    @Default(
        Item(id: '50137', name: '차차 얼굴', subCategoryType: SubCategoryType.face))
    Item? face,
    required Item head,
    // 장비
    Item? hat,
    Item? overAll,
    Item? cash,
    Item? top,
    Item? bottom,
    Item? cape,
    Item? glove,
    Item? shoes,
    Item? shield,
    // 악세
    Item? faceAccessory,
    Item? eyeDecoration,
    Item? earrings,
  }) = _Equipment;

  factory Equipment.fromJson(Map<String, Object?> json) =>
      _$EquipmentFromJson(json);
}

extension UrlMaker on Equipment {
  String addVersionAndRegion(String item) {
    return '{"itemId":$item, "version":"389","region":"KMS"},';
  }

  List<String> makeCharacterItemsBody() {
    String url = addVersionAndRegion(head.id) +
        addVersionAndRegion(head.id.substring(1));
    if (hat != null) url += addVersionAndRegion(hat!.id);
    if (cash != null) url += addVersionAndRegion(cash!.id);
    if (cape != null) url += addVersionAndRegion(cape!.id);
    if (glove != null) url += addVersionAndRegion(glove!.id);
    if (shoes != null) url += addVersionAndRegion(shoes!.id);
    if (shield != null) url += addVersionAndRegion(shield!.id);
    if (faceAccessory != null) url += addVersionAndRegion(faceAccessory!.id);
    if (eyeDecoration != null) url += addVersionAndRegion(eyeDecoration!.id);
    if (earrings != null) url += addVersionAndRegion(earrings!.id);

    // 한벌옷을 입었을 경우에는 한벌옷만 추가, 아니면 상하의 추가
    if (overAll != null) {
      url += addVersionAndRegion(overAll!.id);
    } else {
      // 상, 하의를 입지 않았을 경우에는 기본 속옷 추가
      if (top != null)
        url += addVersionAndRegion(top!.id);
      else
        url += addVersionAndRegion('1040036');

      if (bottom != null)
        url += addVersionAndRegion(bottom!.id);
      else
        url += addVersionAndRegion('1060026');
    }

    // 뷰티
    String beauty1 = '';
    String beauty2 = '';
    if (hair != null) {
      beauty1 = addVersionAndRegion(hair!.id.replaceRange(4, 5, hairColor1));
      beauty2 = addVersionAndRegion(hair!.id.replaceRange(4, 5, hairColor2));
    }
    if (face != null) {
      beauty1 += addVersionAndRegion(face!.id.replaceRange(2, 3, lensColor1));
      beauty2 += addVersionAndRegion(face!.id.replaceRange(2, 3, lensColor2));
    }

    return [url + beauty1, url + beauty2];
  }
}
