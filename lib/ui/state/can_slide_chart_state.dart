import 'package:moufu/domain/chart_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'can_slide_chart_state.freezed.dart';

@freezed
class CanSlideChartState with _$CanSlideChartState {
  const factory CanSlideChartState({
    @Default([]) List<BodyWeightDataModel> bodyWeightData,
    @Default([]) List<BodyFatPercentageDataModel> bodyFatPercentageData,
    @Default([]) List<BodyWeightDataModel> averageBodyWeightData,
    @Default([]) List<BodyFatPercentageDataModel> averageBodyFatPercentageData,
    @Default(DateRangeType.week) DateRangeType rangeType,
    @Default(70) double latestWeight,
    @Default(40) double latestBodyFatPercentage,
  }) = _CanSlideChartState;
}
