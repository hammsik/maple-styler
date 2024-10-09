import 'package:freezed_annotation/freezed_annotation.dart';

part 'item.freezed.dart';
part 'item.g.dart';

@freezed
class Item with _$Item {
  const factory Item({
    required String id,
    required String name,
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
