// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'character_history.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$History {
  List<Equipment> get equipments => throw _privateConstructorUsedError;
  int get maxHistoryLength => throw _privateConstructorUsedError;
  int get historyIndex => throw _privateConstructorUsedError;

  /// Create a copy of History
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HistoryCopyWith<History> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HistoryCopyWith<$Res> {
  factory $HistoryCopyWith(History value, $Res Function(History) then) =
      _$HistoryCopyWithImpl<$Res, History>;
  @useResult
  $Res call(
      {List<Equipment> equipments, int maxHistoryLength, int historyIndex});
}

/// @nodoc
class _$HistoryCopyWithImpl<$Res, $Val extends History>
    implements $HistoryCopyWith<$Res> {
  _$HistoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of History
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? equipments = null,
    Object? maxHistoryLength = null,
    Object? historyIndex = null,
  }) {
    return _then(_value.copyWith(
      equipments: null == equipments
          ? _value.equipments
          : equipments // ignore: cast_nullable_to_non_nullable
              as List<Equipment>,
      maxHistoryLength: null == maxHistoryLength
          ? _value.maxHistoryLength
          : maxHistoryLength // ignore: cast_nullable_to_non_nullable
              as int,
      historyIndex: null == historyIndex
          ? _value.historyIndex
          : historyIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HistoryImplCopyWith<$Res> implements $HistoryCopyWith<$Res> {
  factory _$$HistoryImplCopyWith(
          _$HistoryImpl value, $Res Function(_$HistoryImpl) then) =
      __$$HistoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<Equipment> equipments, int maxHistoryLength, int historyIndex});
}

/// @nodoc
class __$$HistoryImplCopyWithImpl<$Res>
    extends _$HistoryCopyWithImpl<$Res, _$HistoryImpl>
    implements _$$HistoryImplCopyWith<$Res> {
  __$$HistoryImplCopyWithImpl(
      _$HistoryImpl _value, $Res Function(_$HistoryImpl) _then)
      : super(_value, _then);

  /// Create a copy of History
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? equipments = null,
    Object? maxHistoryLength = null,
    Object? historyIndex = null,
  }) {
    return _then(_$HistoryImpl(
      equipments: null == equipments
          ? _value._equipments
          : equipments // ignore: cast_nullable_to_non_nullable
              as List<Equipment>,
      maxHistoryLength: null == maxHistoryLength
          ? _value.maxHistoryLength
          : maxHistoryLength // ignore: cast_nullable_to_non_nullable
              as int,
      historyIndex: null == historyIndex
          ? _value.historyIndex
          : historyIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$HistoryImpl implements _History {
  const _$HistoryImpl(
      {required final List<Equipment> equipments,
      required this.maxHistoryLength,
      this.historyIndex = 0})
      : _equipments = equipments;

  final List<Equipment> _equipments;
  @override
  List<Equipment> get equipments {
    if (_equipments is EqualUnmodifiableListView) return _equipments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_equipments);
  }

  @override
  final int maxHistoryLength;
  @override
  @JsonKey()
  final int historyIndex;

  @override
  String toString() {
    return 'History(equipments: $equipments, maxHistoryLength: $maxHistoryLength, historyIndex: $historyIndex)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HistoryImpl &&
            const DeepCollectionEquality()
                .equals(other._equipments, _equipments) &&
            (identical(other.maxHistoryLength, maxHistoryLength) ||
                other.maxHistoryLength == maxHistoryLength) &&
            (identical(other.historyIndex, historyIndex) ||
                other.historyIndex == historyIndex));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_equipments),
      maxHistoryLength,
      historyIndex);

  /// Create a copy of History
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HistoryImplCopyWith<_$HistoryImpl> get copyWith =>
      __$$HistoryImplCopyWithImpl<_$HistoryImpl>(this, _$identity);
}

abstract class _History implements History {
  const factory _History(
      {required final List<Equipment> equipments,
      required final int maxHistoryLength,
      final int historyIndex}) = _$HistoryImpl;

  @override
  List<Equipment> get equipments;
  @override
  int get maxHistoryLength;
  @override
  int get historyIndex;

  /// Create a copy of History
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HistoryImplCopyWith<_$HistoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
