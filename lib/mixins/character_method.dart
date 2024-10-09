import 'package:maple_closet/data/color_palette.dart';
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
        return equipment.copyWith(
          hair: item,
        );
      case SubCategoryType.face:
        return equipment.copyWith(face: item);
      case SubCategoryType.head:
        // head를 벗기는 경우는 없음
        return equipment.copyWith(head: item!);
      // 장비
      case SubCategoryType.hat:
        return equipment.copyWith(hat: item);
      case SubCategoryType.overall:
        return equipment.copyWith(
          overAll: item,
          top: const Item(id: '1040036', name: '상의 이너'),
          bottom: const Item(id: '1060026', name: '하의 이너'),
        );
      case SubCategoryType.cash:
        return equipment.copyWith(cash: item);
      case SubCategoryType.top:
        return equipment.copyWith(
            top: item, overAll: const Item(id: 'null', name: 'null'));
      case SubCategoryType.bottom:
        return equipment.copyWith(
            bottom: item, overAll: const Item(id: 'null', name: 'null'));
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

  String convertHairColorKeyToString({
    required HairColor hairColor,
  }) {
    switch (hairColor) {
      case HairColor.red:
        return '1';
      case HairColor.orange:
        return '2';
      case HairColor.yellow:
        return '3';
      case HairColor.green:
        return '4';
      case HairColor.blue:
        return '5';
      case HairColor.purple:
        return '6';
      case HairColor.brown:
        return '7';
      case HairColor.black:
        return '0';
    }
  }

  String convertLensColorKeyToString({
    required LensColor lensColor,
  }) {
    switch (lensColor) {
      case LensColor.red:
        return '2';
      case LensColor.magenta:
        return '7';
      case LensColor.green:
        return '3';
      case LensColor.emerald:
        return '5';
      case LensColor.blue:
        return '1';
      case LensColor.purple:
        return '6';
      case LensColor.brown:
        return '4';
      case LensColor.black:
        return '0';
    }
  }
}
