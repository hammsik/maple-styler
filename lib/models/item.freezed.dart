// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Item _$ItemFromJson(Map<String, dynamic> json) {
  return _Item.fromJson(json);
}

/// @nodoc
mixin _$Item {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  SubCategoryType get subCategoryType => throw _privateConstructorUsedError;
  Prism? get prism => throw _privateConstructorUsedError;

  /// Serializes this Item to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Item
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ItemCopyWith<Item> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ItemCopyWith<$Res> {
  factory $ItemCopyWith(Item value, $Res Function(Item) then) =
      _$ItemCopyWithImpl<$Res, Item>;
  @useResult
  $Res call(
      {String id, String name, SubCategoryType subCategoryType, Prism? prism});

  $PrismCopyWith<$Res>? get prism;
}

/// @nodoc
class _$ItemCopyWithImpl<$Res, $Val extends Item>
    implements $ItemCopyWith<$Res> {
  _$ItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Item
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? subCategoryType = null,
    Object? prism = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      subCategoryType: null == subCategoryType
          ? _value.subCategoryType
          : subCategoryType // ignore: cast_nullable_to_non_nullable
              as SubCategoryType,
      prism: freezed == prism
          ? _value.prism
          : prism // ignore: cast_nullable_to_non_nullable
              as Prism?,
    ) as $Val);
  }

  /// Create a copy of Item
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PrismCopyWith<$Res>? get prism {
    if (_value.prism == null) {
      return null;
    }

    return $PrismCopyWith<$Res>(_value.prism!, (value) {
      return _then(_value.copyWith(prism: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ItemImplCopyWith<$Res> implements $ItemCopyWith<$Res> {
  factory _$$ItemImplCopyWith(
          _$ItemImpl value, $Res Function(_$ItemImpl) then) =
      __$$ItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id, String name, SubCategoryType subCategoryType, Prism? prism});

  @override
  $PrismCopyWith<$Res>? get prism;
}

/// @nodoc
class __$$ItemImplCopyWithImpl<$Res>
    extends _$ItemCopyWithImpl<$Res, _$ItemImpl>
    implements _$$ItemImplCopyWith<$Res> {
  __$$ItemImplCopyWithImpl(_$ItemImpl _value, $Res Function(_$ItemImpl) _then)
      : super(_value, _then);

  /// Create a copy of Item
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? subCategoryType = null,
    Object? prism = freezed,
  }) {
    return _then(_$ItemImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      subCategoryType: null == subCategoryType
          ? _value.subCategoryType
          : subCategoryType // ignore: cast_nullable_to_non_nullable
              as SubCategoryType,
      prism: freezed == prism
          ? _value.prism
          : prism // ignore: cast_nullable_to_non_nullable
              as Prism?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ItemImpl implements _Item {
  const _$ItemImpl(
      {required this.id,
      required this.name,
      required this.subCategoryType,
      this.prism});

  factory _$ItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$ItemImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final SubCategoryType subCategoryType;
  @override
  final Prism? prism;

  @override
  String toString() {
    return 'Item(id: $id, name: $name, subCategoryType: $subCategoryType, prism: $prism)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.subCategoryType, subCategoryType) ||
                other.subCategoryType == subCategoryType) &&
            (identical(other.prism, prism) || other.prism == prism));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, subCategoryType, prism);

  /// Create a copy of Item
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ItemImplCopyWith<_$ItemImpl> get copyWith =>
      __$$ItemImplCopyWithImpl<_$ItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ItemImplToJson(
      this,
    );
  }
}

abstract class _Item implements Item {
  const factory _Item(
      {required final String id,
      required final String name,
      required final SubCategoryType subCategoryType,
      final Prism? prism}) = _$ItemImpl;

  factory _Item.fromJson(Map<String, dynamic> json) = _$ItemImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  SubCategoryType get subCategoryType;
  @override
  Prism? get prism;

  /// Create a copy of Item
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ItemImplCopyWith<_$ItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Prism _$PrismFromJson(Map<String, dynamic> json) {
  return _Prism.fromJson(json);
}

/// @nodoc
mixin _$Prism {
  String? get hue => throw _privateConstructorUsedError;
  String? get saturation => throw _privateConstructorUsedError;
  String? get contrast => throw _privateConstructorUsedError;
  String? get brightness => throw _privateConstructorUsedError;

  /// Serializes this Prism to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Prism
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PrismCopyWith<Prism> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PrismCopyWith<$Res> {
  factory $PrismCopyWith(Prism value, $Res Function(Prism) then) =
      _$PrismCopyWithImpl<$Res, Prism>;
  @useResult
  $Res call(
      {String? hue, String? saturation, String? contrast, String? brightness});
}

/// @nodoc
class _$PrismCopyWithImpl<$Res, $Val extends Prism>
    implements $PrismCopyWith<$Res> {
  _$PrismCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Prism
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hue = freezed,
    Object? saturation = freezed,
    Object? contrast = freezed,
    Object? brightness = freezed,
  }) {
    return _then(_value.copyWith(
      hue: freezed == hue
          ? _value.hue
          : hue // ignore: cast_nullable_to_non_nullable
              as String?,
      saturation: freezed == saturation
          ? _value.saturation
          : saturation // ignore: cast_nullable_to_non_nullable
              as String?,
      contrast: freezed == contrast
          ? _value.contrast
          : contrast // ignore: cast_nullable_to_non_nullable
              as String?,
      brightness: freezed == brightness
          ? _value.brightness
          : brightness // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PrismImplCopyWith<$Res> implements $PrismCopyWith<$Res> {
  factory _$$PrismImplCopyWith(
          _$PrismImpl value, $Res Function(_$PrismImpl) then) =
      __$$PrismImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? hue, String? saturation, String? contrast, String? brightness});
}

/// @nodoc
class __$$PrismImplCopyWithImpl<$Res>
    extends _$PrismCopyWithImpl<$Res, _$PrismImpl>
    implements _$$PrismImplCopyWith<$Res> {
  __$$PrismImplCopyWithImpl(
      _$PrismImpl _value, $Res Function(_$PrismImpl) _then)
      : super(_value, _then);

  /// Create a copy of Prism
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hue = freezed,
    Object? saturation = freezed,
    Object? contrast = freezed,
    Object? brightness = freezed,
  }) {
    return _then(_$PrismImpl(
      hue: freezed == hue
          ? _value.hue
          : hue // ignore: cast_nullable_to_non_nullable
              as String?,
      saturation: freezed == saturation
          ? _value.saturation
          : saturation // ignore: cast_nullable_to_non_nullable
              as String?,
      contrast: freezed == contrast
          ? _value.contrast
          : contrast // ignore: cast_nullable_to_non_nullable
              as String?,
      brightness: freezed == brightness
          ? _value.brightness
          : brightness // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PrismImpl implements _Prism {
  const _$PrismImpl(
      {this.hue, this.saturation, this.contrast, this.brightness});

  factory _$PrismImpl.fromJson(Map<String, dynamic> json) =>
      _$$PrismImplFromJson(json);

  @override
  final String? hue;
  @override
  final String? saturation;
  @override
  final String? contrast;
  @override
  final String? brightness;

  @override
  String toString() {
    return 'Prism(hue: $hue, saturation: $saturation, contrast: $contrast, brightness: $brightness)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PrismImpl &&
            (identical(other.hue, hue) || other.hue == hue) &&
            (identical(other.saturation, saturation) ||
                other.saturation == saturation) &&
            (identical(other.contrast, contrast) ||
                other.contrast == contrast) &&
            (identical(other.brightness, brightness) ||
                other.brightness == brightness));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, hue, saturation, contrast, brightness);

  /// Create a copy of Prism
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PrismImplCopyWith<_$PrismImpl> get copyWith =>
      __$$PrismImplCopyWithImpl<_$PrismImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PrismImplToJson(
      this,
    );
  }
}

abstract class _Prism implements Prism {
  const factory _Prism(
      {final String? hue,
      final String? saturation,
      final String? contrast,
      final String? brightness}) = _$PrismImpl;

  factory _Prism.fromJson(Map<String, dynamic> json) = _$PrismImpl.fromJson;

  @override
  String? get hue;
  @override
  String? get saturation;
  @override
  String? get contrast;
  @override
  String? get brightness;

  /// Create a copy of Prism
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PrismImplCopyWith<_$PrismImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
