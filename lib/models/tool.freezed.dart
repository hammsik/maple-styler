// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tool.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SubCategory {
  String get nameKo => throw _privateConstructorUsedError;
  String get nameEn => throw _privateConstructorUsedError;
  SubCategoryType get type => throw _privateConstructorUsedError;

  /// Create a copy of SubCategory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SubCategoryCopyWith<SubCategory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubCategoryCopyWith<$Res> {
  factory $SubCategoryCopyWith(
          SubCategory value, $Res Function(SubCategory) then) =
      _$SubCategoryCopyWithImpl<$Res, SubCategory>;
  @useResult
  $Res call({String nameKo, String nameEn, SubCategoryType type});
}

/// @nodoc
class _$SubCategoryCopyWithImpl<$Res, $Val extends SubCategory>
    implements $SubCategoryCopyWith<$Res> {
  _$SubCategoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SubCategory
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nameKo = null,
    Object? nameEn = null,
    Object? type = null,
  }) {
    return _then(_value.copyWith(
      nameKo: null == nameKo
          ? _value.nameKo
          : nameKo // ignore: cast_nullable_to_non_nullable
              as String,
      nameEn: null == nameEn
          ? _value.nameEn
          : nameEn // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as SubCategoryType,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SubCategoryImplCopyWith<$Res>
    implements $SubCategoryCopyWith<$Res> {
  factory _$$SubCategoryImplCopyWith(
          _$SubCategoryImpl value, $Res Function(_$SubCategoryImpl) then) =
      __$$SubCategoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String nameKo, String nameEn, SubCategoryType type});
}

/// @nodoc
class __$$SubCategoryImplCopyWithImpl<$Res>
    extends _$SubCategoryCopyWithImpl<$Res, _$SubCategoryImpl>
    implements _$$SubCategoryImplCopyWith<$Res> {
  __$$SubCategoryImplCopyWithImpl(
      _$SubCategoryImpl _value, $Res Function(_$SubCategoryImpl) _then)
      : super(_value, _then);

  /// Create a copy of SubCategory
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nameKo = null,
    Object? nameEn = null,
    Object? type = null,
  }) {
    return _then(_$SubCategoryImpl(
      nameKo: null == nameKo
          ? _value.nameKo
          : nameKo // ignore: cast_nullable_to_non_nullable
              as String,
      nameEn: null == nameEn
          ? _value.nameEn
          : nameEn // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as SubCategoryType,
    ));
  }
}

/// @nodoc

class _$SubCategoryImpl implements _SubCategory {
  const _$SubCategoryImpl(
      {required this.nameKo, required this.nameEn, required this.type});

  @override
  final String nameKo;
  @override
  final String nameEn;
  @override
  final SubCategoryType type;

  @override
  String toString() {
    return 'SubCategory(nameKo: $nameKo, nameEn: $nameEn, type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SubCategoryImpl &&
            (identical(other.nameKo, nameKo) || other.nameKo == nameKo) &&
            (identical(other.nameEn, nameEn) || other.nameEn == nameEn) &&
            (identical(other.type, type) || other.type == type));
  }

  @override
  int get hashCode => Object.hash(runtimeType, nameKo, nameEn, type);

  /// Create a copy of SubCategory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SubCategoryImplCopyWith<_$SubCategoryImpl> get copyWith =>
      __$$SubCategoryImplCopyWithImpl<_$SubCategoryImpl>(this, _$identity);
}

abstract class _SubCategory implements SubCategory {
  const factory _SubCategory(
      {required final String nameKo,
      required final String nameEn,
      required final SubCategoryType type}) = _$SubCategoryImpl;

  @override
  String get nameKo;
  @override
  String get nameEn;
  @override
  SubCategoryType get type;

  /// Create a copy of SubCategory
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SubCategoryImplCopyWith<_$SubCategoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$MyTool {
  String get toolNameKo => throw _privateConstructorUsedError;
  ToolType get toolType => throw _privateConstructorUsedError;
  SubCategoryType? get currentSubcategoryType =>
      throw _privateConstructorUsedError;
  Map<SubCategoryType, SubCategory>? get subCategoryMap =>
      throw _privateConstructorUsedError;

  /// Create a copy of MyTool
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MyToolCopyWith<MyTool> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MyToolCopyWith<$Res> {
  factory $MyToolCopyWith(MyTool value, $Res Function(MyTool) then) =
      _$MyToolCopyWithImpl<$Res, MyTool>;
  @useResult
  $Res call(
      {String toolNameKo,
      ToolType toolType,
      SubCategoryType? currentSubcategoryType,
      Map<SubCategoryType, SubCategory>? subCategoryMap});
}

/// @nodoc
class _$MyToolCopyWithImpl<$Res, $Val extends MyTool>
    implements $MyToolCopyWith<$Res> {
  _$MyToolCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MyTool
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? toolNameKo = null,
    Object? toolType = null,
    Object? currentSubcategoryType = freezed,
    Object? subCategoryMap = freezed,
  }) {
    return _then(_value.copyWith(
      toolNameKo: null == toolNameKo
          ? _value.toolNameKo
          : toolNameKo // ignore: cast_nullable_to_non_nullable
              as String,
      toolType: null == toolType
          ? _value.toolType
          : toolType // ignore: cast_nullable_to_non_nullable
              as ToolType,
      currentSubcategoryType: freezed == currentSubcategoryType
          ? _value.currentSubcategoryType
          : currentSubcategoryType // ignore: cast_nullable_to_non_nullable
              as SubCategoryType?,
      subCategoryMap: freezed == subCategoryMap
          ? _value.subCategoryMap
          : subCategoryMap // ignore: cast_nullable_to_non_nullable
              as Map<SubCategoryType, SubCategory>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MyToolImplCopyWith<$Res> implements $MyToolCopyWith<$Res> {
  factory _$$MyToolImplCopyWith(
          _$MyToolImpl value, $Res Function(_$MyToolImpl) then) =
      __$$MyToolImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String toolNameKo,
      ToolType toolType,
      SubCategoryType? currentSubcategoryType,
      Map<SubCategoryType, SubCategory>? subCategoryMap});
}

/// @nodoc
class __$$MyToolImplCopyWithImpl<$Res>
    extends _$MyToolCopyWithImpl<$Res, _$MyToolImpl>
    implements _$$MyToolImplCopyWith<$Res> {
  __$$MyToolImplCopyWithImpl(
      _$MyToolImpl _value, $Res Function(_$MyToolImpl) _then)
      : super(_value, _then);

  /// Create a copy of MyTool
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? toolNameKo = null,
    Object? toolType = null,
    Object? currentSubcategoryType = freezed,
    Object? subCategoryMap = freezed,
  }) {
    return _then(_$MyToolImpl(
      toolNameKo: null == toolNameKo
          ? _value.toolNameKo
          : toolNameKo // ignore: cast_nullable_to_non_nullable
              as String,
      toolType: null == toolType
          ? _value.toolType
          : toolType // ignore: cast_nullable_to_non_nullable
              as ToolType,
      currentSubcategoryType: freezed == currentSubcategoryType
          ? _value.currentSubcategoryType
          : currentSubcategoryType // ignore: cast_nullable_to_non_nullable
              as SubCategoryType?,
      subCategoryMap: freezed == subCategoryMap
          ? _value._subCategoryMap
          : subCategoryMap // ignore: cast_nullable_to_non_nullable
              as Map<SubCategoryType, SubCategory>?,
    ));
  }
}

/// @nodoc

class _$MyToolImpl implements _MyTool {
  const _$MyToolImpl(
      {required this.toolNameKo,
      required this.toolType,
      this.currentSubcategoryType,
      final Map<SubCategoryType, SubCategory>? subCategoryMap})
      : _subCategoryMap = subCategoryMap;

  @override
  final String toolNameKo;
  @override
  final ToolType toolType;
  @override
  final SubCategoryType? currentSubcategoryType;
  final Map<SubCategoryType, SubCategory>? _subCategoryMap;
  @override
  Map<SubCategoryType, SubCategory>? get subCategoryMap {
    final value = _subCategoryMap;
    if (value == null) return null;
    if (_subCategoryMap is EqualUnmodifiableMapView) return _subCategoryMap;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'MyTool(toolNameKo: $toolNameKo, toolType: $toolType, currentSubcategoryType: $currentSubcategoryType, subCategoryMap: $subCategoryMap)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MyToolImpl &&
            (identical(other.toolNameKo, toolNameKo) ||
                other.toolNameKo == toolNameKo) &&
            (identical(other.toolType, toolType) ||
                other.toolType == toolType) &&
            (identical(other.currentSubcategoryType, currentSubcategoryType) ||
                other.currentSubcategoryType == currentSubcategoryType) &&
            const DeepCollectionEquality()
                .equals(other._subCategoryMap, _subCategoryMap));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      toolNameKo,
      toolType,
      currentSubcategoryType,
      const DeepCollectionEquality().hash(_subCategoryMap));

  /// Create a copy of MyTool
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MyToolImplCopyWith<_$MyToolImpl> get copyWith =>
      __$$MyToolImplCopyWithImpl<_$MyToolImpl>(this, _$identity);
}

abstract class _MyTool implements MyTool {
  const factory _MyTool(
      {required final String toolNameKo,
      required final ToolType toolType,
      final SubCategoryType? currentSubcategoryType,
      final Map<SubCategoryType, SubCategory>? subCategoryMap}) = _$MyToolImpl;

  @override
  String get toolNameKo;
  @override
  ToolType get toolType;
  @override
  SubCategoryType? get currentSubcategoryType;
  @override
  Map<SubCategoryType, SubCategory>? get subCategoryMap;

  /// Create a copy of MyTool
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MyToolImplCopyWith<_$MyToolImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
