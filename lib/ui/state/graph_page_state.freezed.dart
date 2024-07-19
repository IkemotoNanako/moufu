// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'graph_page_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$GraphPageState {
  List<BodyWeightData> get bodyWeightData => throw _privateConstructorUsedError;
  List<BodyFatPercentageData> get bodyFatPercentageData =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GraphPageStateCopyWith<GraphPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GraphPageStateCopyWith<$Res> {
  factory $GraphPageStateCopyWith(
          GraphPageState value, $Res Function(GraphPageState) then) =
      _$GraphPageStateCopyWithImpl<$Res, GraphPageState>;
  @useResult
  $Res call(
      {List<BodyWeightData> bodyWeightData,
      List<BodyFatPercentageData> bodyFatPercentageData});
}

/// @nodoc
class _$GraphPageStateCopyWithImpl<$Res, $Val extends GraphPageState>
    implements $GraphPageStateCopyWith<$Res> {
  _$GraphPageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bodyWeightData = null,
    Object? bodyFatPercentageData = null,
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GraphPageStateImplCopyWith<$Res>
    implements $GraphPageStateCopyWith<$Res> {
  factory _$$GraphPageStateImplCopyWith(_$GraphPageStateImpl value,
          $Res Function(_$GraphPageStateImpl) then) =
      __$$GraphPageStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<BodyWeightData> bodyWeightData,
      List<BodyFatPercentageData> bodyFatPercentageData});
}

/// @nodoc
class __$$GraphPageStateImplCopyWithImpl<$Res>
    extends _$GraphPageStateCopyWithImpl<$Res, _$GraphPageStateImpl>
    implements _$$GraphPageStateImplCopyWith<$Res> {
  __$$GraphPageStateImplCopyWithImpl(
      _$GraphPageStateImpl _value, $Res Function(_$GraphPageStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bodyWeightData = null,
    Object? bodyFatPercentageData = null,
  }) {
    return _then(_$GraphPageStateImpl(
      bodyWeightData: null == bodyWeightData
          ? _value._bodyWeightData
          : bodyWeightData // ignore: cast_nullable_to_non_nullable
              as List<BodyWeightData>,
      bodyFatPercentageData: null == bodyFatPercentageData
          ? _value._bodyFatPercentageData
          : bodyFatPercentageData // ignore: cast_nullable_to_non_nullable
              as List<BodyFatPercentageData>,
    ));
  }
}

/// @nodoc

class _$GraphPageStateImpl implements _GraphPageState {
  const _$GraphPageStateImpl(
      {required final List<BodyWeightData> bodyWeightData,
      required final List<BodyFatPercentageData> bodyFatPercentageData})
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
  String toString() {
    return 'GraphPageState(bodyWeightData: $bodyWeightData, bodyFatPercentageData: $bodyFatPercentageData)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GraphPageStateImpl &&
            const DeepCollectionEquality()
                .equals(other._bodyWeightData, _bodyWeightData) &&
            const DeepCollectionEquality()
                .equals(other._bodyFatPercentageData, _bodyFatPercentageData));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_bodyWeightData),
      const DeepCollectionEquality().hash(_bodyFatPercentageData));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GraphPageStateImplCopyWith<_$GraphPageStateImpl> get copyWith =>
      __$$GraphPageStateImplCopyWithImpl<_$GraphPageStateImpl>(
          this, _$identity);
}

abstract class _GraphPageState implements GraphPageState {
  const factory _GraphPageState(
          {required final List<BodyWeightData> bodyWeightData,
          required final List<BodyFatPercentageData> bodyFatPercentageData}) =
      _$GraphPageStateImpl;

  @override
  List<BodyWeightData> get bodyWeightData;
  @override
  List<BodyFatPercentageData> get bodyFatPercentageData;
  @override
  @JsonKey(ignore: true)
  _$$GraphPageStateImplCopyWith<_$GraphPageStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
