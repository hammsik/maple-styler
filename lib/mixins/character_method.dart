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
        return equipment.copyWith(overAll: item, top: null, bottom: null);
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
}
