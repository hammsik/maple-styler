import 'package:freezed_annotation/freezed_annotation.dart';

part 'tool.freezed.dart';
part 'tool.g.dart';

enum ToolType {
  beauty,
  armor,
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
  cash,
  top,
  bottom,
  cape,
  glove,
  shoes,
  shield,
  faceAccessory,
  eyeDecoration,
  earrings,
}

@freezed
class SubCategory with _$SubCategory {
  const factory SubCategory({
    required String nameKo,
    required String nameEn,
    required SubCategoryType type,
  }) = _SubCategory;

  factory SubCategory.fromJson(Map<String, Object?> json) =>
      _$SubCategoryFromJson(json);
}

@freezed
class MyTool with _$MyTool {
  const factory MyTool({
    required String toolNameKo,
    required ToolType toolType,
    required int idx,
    int? subCategoryIdx,
    List<SubCategory>? subCategoryList,
  }) = _MyTool;

  factory MyTool.fromJson(Map<String, Object?> json) => _$MyToolFromJson(json);
}
