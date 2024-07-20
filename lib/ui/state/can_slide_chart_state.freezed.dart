// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'can_slide_chart_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CanSlideChartState {
  List<BodyWeightData> get bodyWeightData => throw _privateConstructorUsedError;
  List<BodyFatPercentageData> get bodyFatPercentageData =>
      throw _privateConstructorUsedError;
  DateRangeType get rangeType => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CanSlideChartStateCopyWith<CanSlideChartState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CanSlideChartStateCopyWith<$Res> {
  factory $CanSlideChartStateCopyWith(
          CanSlideChartState value, $Res Function(CanSlideChartState) then) =
      _$CanSlideChartStateCopyWithImpl<$Res, CanSlideChartState>;
  @useResult
  $Res call(
      {List<BodyWeightData> bodyWeightData,
      List<BodyFatPercentageData> bodyFatPercentageData,
      DateRangeType rangeType});
}

/// @nodoc
class _$CanSlideChartStateCopyWithImpl<$Res, $Val extends CanSlideChartState>
    implements $CanSlideChartStateCopyWith<$Res> {
  _$CanSlideChartStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bodyWeightData = null,
    Object? bodyFatPercentageData = null,
    Object? rangeType = null,
  }) {
    return _then(_value.copyWith(
      bodyWeightData: null == bodyWeightData
          ? _value.bodyWeightData
          : bodyWeightData // ignore: cast_nullable_to_non_nullable
              as List<BodyWeightData>,
      bodyFatPercentageData: null == bodyFatPercentageData
          ? _value.bodyFatPercentageData
          : bodyFatPercentageData // ignore: cast_nullable_to_non_nullable
              as List<BodyFatPercentageData>,
      rangeType: null == rangeType
          ? _value.rangeType
          : rangeType // ignore: cast_nullable_to_non_nullable
              as DateRangeType,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CanSlideChartStateImplCopyWith<$Res>
    implements $CanSlideChartStateCopyWith<$Res> {
  factory _$$CanSlideChartStateImplCopyWith(_$CanSlideChartStateImpl value,
          $Res Function(_$CanSlideChartStateImpl) then) =
      __$$CanSlideChartStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<BodyWeightData> bodyWeightData,
      List<BodyFatPercentageData> bodyFatPercentageData,
      DateRangeType rangeType});
}

/// @nodoc
class __$$CanSlideChartStateImplCopyWithImpl<$Res>
    extends _$CanSlideChartStateCopyWithImpl<$Res, _$CanSlideChartStateImpl>
    implements _$$CanSlideChartStateImplCopyWith<$Res> {
  __$$CanSlideChartStateImplCopyWithImpl(_$CanSlideChartStateImpl _value,
      $Res Function(_$CanSlideChartStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bodyWeightData = null,
    Object? bodyFatPercentageData = null,
    Object? rangeType = null,
  }) {
    return _then(_$CanSlideChartStateImpl(
      bodyWeightData: null == bodyWeightData
          ? _value._bodyWeightData
          : bodyWeightData // ignore: cast_nullable_to_non_nullable
              as List<BodyWeightData>,
      bodyFatPercentageData: null == bodyFatPercentageData
          ? _value._bodyFatPercentageData
          : bodyFatPercentageData // ignore: cast_nullable_to_non_nullable
              as List<BodyFatPercentageData>,
      rangeType: null == rangeType
          ? _value.rangeType
          : rangeType // ignore: cast_nullable_to_non_nullable
              as DateRangeType,
    ));
  }
}

/// @nodoc

class _$CanSlideChartStateImpl implements _CanSlideChartState {
  const _$CanSlideChartStateImpl(
      {required final List<BodyWeightData> bodyWeightData,
      required final List<BodyFatPercentageData> bodyFatPercentageData,
      required this.rangeType})
      : _bodyWeightData = bodyWeightData,
        _bodyFatPercentageData = bodyFatPercentageData;

  final List<BodyWeightData> _bodyWeightData;
  @override
  List<BodyWeightData> get bodyWeightData {
    if (_bodyWeightData is EqualUnmodifiableListView) return _bodyWeightData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_bodyWeightData);
  }

  final List<BodyFatPercentageData> _bodyFatPercentageData;
  @override
  List<BodyFatPercentageData> get bodyFatPercentageData {
    if (_bodyFatPercentageData is EqualUnmodifiableListView)
      return _bodyFatPercentageData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_bodyFatPercentageData);
  }

  @override
  final DateRangeType rangeType;

  @override
  String toString() {
    return 'CanSlideChartState(bodyWeightData: $bodyWeightData, bodyFatPercentageData: $bodyFatPercentageData, rangeType: $rangeType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CanSlideChartStateImpl &&
            const DeepCollectionEquality()
                .equals(other._bodyWeightData, _bodyWeightData) &&
            const DeepCollectionEquality()
                .equals(other._bodyFatPercentageData, _bodyFatPercentageData) &&
            (identical(other.rangeType, rangeType) ||
                other.rangeType == rangeType));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_bodyWeightData),
      const DeepCollectionEquality().hash(_bodyFatPercentageData),
      rangeType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CanSlideChartStateImplCopyWith<_$CanSlideChartStateImpl> get copyWith =>
      __$$CanSlideChartStateImplCopyWithImpl<_$CanSlideChartStateImpl>(
          this, _$identity);
}

abstract class _CanSlideChartState implements CanSlideChartState {
  const factory _CanSlideChartState(
      {required final List<BodyWeightData> bodyWeightData,
      required final List<BodyFatPercentageData> bodyFatPercentageData,
      required final DateRangeType rangeType}) = _$CanSlideChartStateImpl;

  @override
  List<BodyWeightData> get bodyWeightData;
  @override
  List<BodyFatPercentageData> get bodyFatPercentageData;
  @override
  DateRangeType get rangeType;
  @override
  @JsonKey(ignore: true)
  _$$CanSlideChartStateImplCopyWith<_$CanSlideChartStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
