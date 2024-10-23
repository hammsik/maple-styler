import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:maple_closet/models/tool.dart';

part 'item.freezed.dart';
part 'item.g.dart';

@freezed
class Item with _$Item {
  const factory Item({
    required String id,
    required String name,
    required SubCategoryType subCategoryType,
    Prism? prism,
  }) = _Item;

  factory Item.fromJson(Map<String, Object?> json) => _$ItemFromJson(json);
}

@freezed
class Prism with _$Prism {
  const factory Prism({
    String? hue,
    String? saturation,
    String? contrast,
    String? brightness,
  }) = _Prism;

  factory Prism.fromJson(Map<String, Object?> json) => _$PrismFromJson(json);
}

extension ItemConverter on Item {
  // 데이터베이스 모델을 UI 모델로 변환
  static Item itemFromDatabase(dynamic item) {
    SubCategoryType subCategoryType = SubCategoryType.values.firstWhere(
      // SubCategoryType의 경우: eyeDecoration -> eyedecoration
      // db item의 경우: Eye Decoration -> eyedecoration
      (enumType) =>
          enumType.toString().split(".")[1].toLowerCase() ==
          item.subCategory.replaceAll(' ', '').toLowerCase(),
    );

    return Item(
      id: item.itemid.toString(),
      name: item.name,
      subCategoryType: subCategoryType,
    );
  }

  // TODO: UI 모델을 데이터베이스 모델로 변환 구현
}
