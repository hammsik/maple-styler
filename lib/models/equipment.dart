import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:maple_closet/models/item.dart';

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
    @Default(Item(id: '68090', name: '허쉬 헤어')) Item? hair,
    @Default(Item(id: '50137', name: '차차 얼굴')) Item? face,
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
