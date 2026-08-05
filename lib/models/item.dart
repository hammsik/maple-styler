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
    // 무기 세부 분류(예: 'One-Handed Sword'). DB의 'Parent/Child' 포맷에서 Child 부분.
    // 무기가 아닌 아이템은 null.
    String? weaponCategory,
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
  // 무기 대분류(DB) -> SubCategoryType 매핑.
  // 무기만 'Parent/Child' 계층 포맷을 쓰므로 대분류 이름을 명시적으로 매핑한다.
  static const Map<String, SubCategoryType> _weaponParentToSubCategory = {
    'One-Handed Weapon': SubCategoryType.oneHanded,
    'Two-Handed Weapon': SubCategoryType.twoHanded,
  };

  // 데이터베이스 모델을 UI 모델로 변환
  static Item itemFromDatabase(dynamic item) {
    // DB sub_category 예)
    //  - 평면(장비/악세/캐시): 'Hat', 'Face Accessory', 'Cash'
    //  - 무기 계층: 'One-Handed Weapon/One-Handed Sword'
    final String rawSubCategory = item.subCategory as String;
    final List<String> parts = rawSubCategory.split('/');
    final String parentName = parts.first.trim();
    final String? weaponCategory =
        parts.length > 1 ? parts.last.trim() : null;

    final SubCategoryType subCategoryType =
        _subCategoryTypeFromDbName(parentName);

    return Item(
      id: item.itemid.toString(),
      name: item.name,
      subCategoryType: subCategoryType,
      weaponCategory: weaponCategory,
    );
  }

  static SubCategoryType _subCategoryTypeFromDbName(String parentName) {
    // 무기 대분류는 명시 매핑
    final SubCategoryType? weaponType = _weaponParentToSubCategory[parentName];
    if (weaponType != null) return weaponType;

    // 그 외(장비/악세/캐시/뷰티)는 enum 이름과 매칭
    // 예) 'Eye Decoration' -> 'eyedecoration' == SubCategoryType.eyeDecoration
    final String normalized = parentName.replaceAll(' ', '').toLowerCase();
    return SubCategoryType.values.firstWhere(
      (enumType) => enumType.name.toLowerCase() == normalized,
    );
  }

  // TODO: UI 모델을 데이터베이스 모델로 변환 구현
}
