import 'package:freezed_annotation/freezed_annotation.dart';

part 'item.freezed.dart';
part 'item.g.dart';

@freezed
class Item with _$Item {
  const factory Item({
    required String id,
    required String name,
  }) = _Item;

  factory Item.fromJson(Map<String, Object?> json)
      => _$ItemFromJson (json);
}