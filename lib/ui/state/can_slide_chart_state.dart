import 'package:moufu/domain/chart_data.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'can_slide_chart_state.freezed.dart';

@freezed
class CanSlideChartState with _$CanSlideChartState {
  const factory CanSlideChartState({
    @Default([]) List<BodyWeightData> bodyWeightData,
    @Default([]) List<BodyFatPercentageData> bodyFatPercentageData,
    @Default([]) List<BodyWeightData> averageBodyWeightData,
    @Default([]) List<BodyFatPercentageData> averageBodyFatPercentageData,
    @Default(DateRangeType.week) DateRangeType rangeType,
    @Default(70) double latestWeight,
    @Default(40) double latestBodyFatPercentage,
  }) = _CanSlideChartState;
}
