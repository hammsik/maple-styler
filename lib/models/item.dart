import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:maple_closet/database/database.dart';
import 'package:maple_closet/models/skeleton_tools.dart';

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

// extension ItemConverter on Item {
//   // 데이터베이스 모델을 UI 모델로 변환
//   static Item characterItemfromDatabase(CharacterItem item) {
//     return Item(
//       id: dbItem.itemId.value,
//       name: dbItem.name.value,
//     );
//   }

//   // UI 모델을 데이터베이스 모델로 변환
//   ItemsCompanion characterItemtoDatabase() {
//     return ItemsCompanion(
//       itemId: Value(id),
//       name: Value(name),
//     );
//   }
// }
