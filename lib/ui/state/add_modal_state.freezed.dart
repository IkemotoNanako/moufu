// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_modal_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AddModalState {
  double get bodyWeight => throw _privateConstructorUsedError;
  double? get bodyFatPercentage => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AddModalStateCopyWith<AddModalState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddModalStateCopyWith<$Res> {
  factory $AddModalStateCopyWith(
          AddModalState value, $Res Function(AddModalState) then) =
      _$AddModalStateCopyWithImpl<$Res, AddModalState>;
  @useResult
  $Res call({double bodyWeight, double? bodyFatPercentage, DateTime date});
}

/// @nodoc
class _$AddModalStateCopyWithImpl<$Res, $Val extends AddModalState>
    implements $AddModalStateCopyWith<$Res> {
  _$AddModalStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bodyWeight = null,
    Object? bodyFatPercentage = freezed,
    Object? date = null,
  }) {
    return _then(_value.copyWith(
      bodyWeight: null == bodyWeight
          ? _value.bodyWeight
          : bodyWeight // ignore: cast_nullable_to_non_nullable
              as double,
      bodyFatPercentage: freezed == bodyFatPercentage
          ? _value.bodyFatPercentage
          : bodyFatPercentage // ignore: cast_nullable_to_non_nullable
              as double?,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AddModelStateImplCopyWith<$Res>
    implements $AddModalStateCopyWith<$Res> {
  factory _$$AddModelStateImplCopyWith(
          _$AddModelStateImpl value, $Res Function(_$AddModelStateImpl) then) =
      __$$AddModelStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double bodyWeight, double? bodyFatPercentage, DateTime date});
}

/// @nodoc
class __$$AddModelStateImplCopyWithImpl<$Res>
    extends _$AddModalStateCopyWithImpl<$Res, _$AddModelStateImpl>
    implements _$$AddModelStateImplCopyWith<$Res> {
  __$$AddModelStateImplCopyWithImpl(
      _$AddModelStateImpl _value, $Res Function(_$AddModelStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bodyWeight = null,
    Object? bodyFatPercentage = freezed,
    Object? date = null,
  }) {
    return _then(_$AddModelStateImpl(
      bodyWeight: null == bodyWeight
          ? _value.bodyWeight
          : bodyWeight // ignore: cast_nullable_to_non_nullable
              as double,
      bodyFatPercentage: freezed == bodyFatPercentage
          ? _value.bodyFatPercentage
          : bodyFatPercentage // ignore: cast_nullable_to_non_nullable
              as double?,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$AddModelStateImpl implements _AddModelState {
  const _$AddModelStateImpl(
      {required this.bodyWeight,
      required this.bodyFatPercentage,
      required this.date});

  @override
  final double bodyWeight;
  @override
  final double? bodyFatPercentage;
  @override
  final DateTime date;

  @override
  String toString() {
    return 'AddModalState(bodyWeight: $bodyWeight, bodyFatPercentage: $bodyFatPercentage, date: $date)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddModelStateImpl &&
            (identical(other.bodyWeight, bodyWeight) ||
                other.bodyWeight == bodyWeight) &&
            (identical(other.bodyFatPercentage, bodyFatPercentage) ||
                other.bodyFatPercentage == bodyFatPercentage) &&
            (identical(other.date, date) || other.date == date));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, bodyWeight, bodyFatPercentage, date);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddModelStateImplCopyWith<_$AddModelStateImpl> get copyWith =>
      __$$AddModelStateImplCopyWithImpl<_$AddModelStateImpl>(this, _$identity);
}

abstract class _AddModelState implements AddModalState {
  const factory _AddModelState(
      {required final double bodyWeight,
      required final double? bodyFatPercentage,
      required final DateTime date}) = _$AddModelStateImpl;

  @override
  double get bodyWeight;
  @override
  double? get bodyFatPercentage;
  @override
  DateTime get date;
  @override
  @JsonKey(ignore: true)
  _$$AddModelStateImplCopyWith<_$AddModelStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
