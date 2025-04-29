import 'package:freezed_annotation/freezed_annotation.dart';

part 'tool.freezed.dart';

enum ToolType {
  beauty,
  armor,
  weapon,
  accessory,
  color,
  unknown,
  favorite,
}

enum SubCategoryType {
  hair,
  face,
  head,
  hat,
  overall,
  top,
  bottom,
  cape,
  glove,
  shoes,
  shield,
  cash,
  oneHanded,
  twoHanded,
  faceAccessory,
  eyeDecoration,
  earrings,
}

enum WeaponCategoryType {
  // 한손무기
  oneSword,
  oneAxe,
  oneMace,
  dagger,
  staff,
  wand,
  cane,
  shiningRod,
  soulShooter,
  deathParado,
  energeSword,
  esp,
  chain,
  magic,
  tuner,
  breathShooter,
  fan,

  // 두손무기
  twoSword,
  twoAxe,
  twoMace,
  spear,
  polearm,
  bow,
  crossbow,
  claw,
  nekle,
  gun,
  dualBowgun,
  handCannon,
  guntlet,
  ancientBow,
  chacram,
}

@freezed
class SubCategory with _$SubCategory {
  const factory SubCategory({
    required String nameKo,
    required String nameEn,
    required SubCategoryType type,
    WeaponCategoryType? currentWeaponCategoryType,
  }) = _SubCategory;
}

@freezed
class MyTool with _$MyTool {
  const factory MyTool({
    required String toolNameKo,
    required ToolType toolType,
    SubCategoryType? currentSubcategoryType,
    Map<SubCategoryType, SubCategory>? subCategoryMap,
  }) = _MyTool;
}
