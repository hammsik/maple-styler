// ignore_for_file: curly_braces_in_flow_control_structures

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:maple_closet/data/color_palette.dart';
import 'package:maple_closet/models/item.dart';
import 'package:maple_closet/models/tool.dart';

part 'equipment.freezed.dart';

// 코디 아이템을 모아놓은 맵
@freezed
class Equipment with _$Equipment {
  const factory Equipment({
    required HairColor hairColor1,
    required HairColor hairColor2,
    required LensColor lensColor1,
    required LensColor lensColor2,
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

  // factory Equipment.fromJson(Map<String, Object?> json) =>
  //     _$EquipmentFromJson(json);

  factory Equipment.fromJson(Map<String, List> json, Map<String, List> json2) {
    final hairColor1 = HairColor.values.firstWhere(
      (e) => hairColorPalette[e]![1] == int.parse(json['Hair']![2]),
      orElse: () => HairColor.black,
    );
    final lensColor1 = LensColor.values.firstWhere(
      (e) => lensColorPalette[e]![1] == int.parse(json['Face']![2]),
      orElse: () => LensColor.black,
    );

    final hairColor2 = HairColor.values.firstWhere(
      (e) => hairColorPalette[e]![1] == int.parse(json2['Hair']![2]),
      orElse: () => HairColor.black,
    );
    final lensColor2 = LensColor.values.firstWhere(
      (e) => lensColorPalette[e]![1] == int.parse(json2['Face']![2]),
      orElse: () => LensColor.black,
    );

    return Equipment(
      hairColor1: hairColor1,
      lensColor1: lensColor1,
      hairColor2: hairColor2,
      lensColor2: lensColor2,
      head: Item(
        id: json['Head']![0],
        name: json['Head']![1],
        subCategoryType: SubCategoryType.head,
      ),
      hair: json['Hair']![0] != 'null'
          ? Item(
              id: json['Hair']![0],
              name: json['Hair']![1],
              subCategoryType: SubCategoryType.hair,
            )
          : null,
      face: json['Face']![0] != 'null'
          ? Item(
              id: json['Face']![0],
              name: json['Face']![1],
              subCategoryType: SubCategoryType.face,
            )
          : null,
      hat: json['Hat']![0] != 'null'
          ? Item(
              id: json['Hat']![0],
              name: json['Hat']![1],
              subCategoryType: SubCategoryType.hat,
            )
          : null,
      overAll: json['Overall']![0] != 'null'
          ? Item(
              id: json['Overall']![0],
              name: json['Overall']![1],
              subCategoryType: SubCategoryType.overall,
            )
          : null,
      cash: json['Cash']![0] != 'null'
          ? Item(
              id: json['Cash']![0],
              name: json['Cash']![1],
              subCategoryType: SubCategoryType.cash,
            )
          : null,
      top: json['Top']![0] != 'null'
          ? Item(
              id: json['Top']![0],
              name: json['Top']![1],
              subCategoryType: SubCategoryType.top,
            )
          : null,
      bottom: json['Bottom']![0] != 'null'
          ? Item(
              id: json['Bottom']![0],
              name: json['Bottom']![1],
              subCategoryType: SubCategoryType.bottom,
            )
          : null,
      cape: json['Cape']![0] != 'null'
          ? Item(
              id: json['Cape']![0],
              name: json['Cape']![1],
              subCategoryType: SubCategoryType.cape,
            )
          : null,
      glove: json['Glove']![0] != 'null'
          ? Item(
              id: json['Glove']![0],
              name: json['Glove']![1],
              subCategoryType: SubCategoryType.glove,
            )
          : null,
      shoes: json['Shoes']![0] != 'null'
          ? Item(
              id: json['Shoes']![0],
              name: json['Shoes']![1],
              subCategoryType: SubCategoryType.shoes,
            )
          : null,
      shield: json['Shield']![0] != 'null'
          ? Item(
              id: json['Shield']![0],
              name: json['Shield']![1],
              subCategoryType: SubCategoryType.shield,
            )
          : null,
      faceAccessory: json['Face Accessory']![0] != 'null'
          ? Item(
              id: json['Face Accessory']![0],
              name: json['Face Accessory']![1],
              subCategoryType: SubCategoryType.faceAccessory,
            )
          : null,
      eyeDecoration: json['Eye Decoration']![0] != 'null'
          ? Item(
              id: json['Eye Decoration']![0],
              name: json['Eye Decoration']![1],
              subCategoryType: SubCategoryType.eyeDecoration,
            )
          : null,
      earrings: json['Earrings']![0] != 'null'
          ? Item(
              id: json['Earrings']![0],
              name: json['Earrings']![1],
              subCategoryType: SubCategoryType.earrings,
            )
          : null,
    );
  }
}

extension ExtensionForToJson on Equipment {
  Map<String, List> customToJson({required bool isOne}) {
    final hairColor = isOne ? hairColor1 : hairColor2;
    final lensColor = isOne ? lensColor1 : lensColor2;

    return {
      'Hair': [
        hair?.id ?? 'null',
        hair?.name ?? 'null',
        hairColorPalette[hairColor]![1]
      ],
      'Face': [
        face?.id ?? 'null',
        face?.name ?? 'null',
        lensColorPalette[lensColor]![1]
      ],
      'Head': [head.id, head.name],
      'Hat': [hat?.id ?? 'null', hat?.name ?? 'null'],
      'Overall': [overAll?.id ?? 'null', overAll?.name ?? 'null'],
      'Cash': [cash?.id ?? 'null', cash?.name ?? 'null'],
      'Top': [top?.id ?? 'null', top?.name ?? 'null'],
      'Bottom': [bottom?.id ?? 'null', bottom?.name ?? 'null'],
      'Cape': [cape?.id ?? 'null', cape?.name ?? 'null'],
      'Glove': [glove?.id ?? 'null', glove?.name ?? 'null'],
      'Shoes': [shoes?.id ?? 'null', shoes?.name ?? 'null'],
      'Shield': [shield?.id ?? 'null', shield?.name ?? 'null'],
      'Face Accessory': [
        faceAccessory?.id ?? 'null',
        faceAccessory?.name ?? 'null'
      ],
      'Eye Decoration': [
        eyeDecoration?.id ?? 'null',
        eyeDecoration?.name ?? 'null'
      ],
      'Earrings': [earrings?.id ?? 'null', earrings?.name ?? 'null'],
    };
  }
}

extension UrlMaker on Equipment {
  String addVersionAndRegion(String item) {
    return '{"itemId":$item, "version":"389","region":"KMS"},';
  }

  List<String> makeCharacterItemsBodyPair() {
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
      beauty1 = addVersionAndRegion(hair!.id
          .replaceRange(4, 5, hairColorPalette[hairColor1]![1].toString()));
      beauty2 = addVersionAndRegion(hair!.id
          .replaceRange(4, 5, hairColorPalette[hairColor2]![1].toString()));
    }
    if (face != null) {
      beauty1 += addVersionAndRegion(face!.id
          .replaceRange(2, 3, lensColorPalette[lensColor1]![1].toString()));
      beauty2 += addVersionAndRegion(face!.id
          .replaceRange(2, 3, lensColorPalette[lensColor2]![1].toString()));
    }

    return [beauty1 + url, beauty2 + url];
  }
}
