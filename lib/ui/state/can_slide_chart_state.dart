import 'package:moufu/domain/chart_data.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'can_slide_chart_state.freezed.dart';

@freezed
class CanSlideChartState with _$CanSlideChartState {
  const factory CanSlideChartState({
    required List<BodyWeightData> bodyWeightData,
    required List<BodyFatPercentageData> bodyFatPercentageData,
    required DateRangeType rangeType,
  }) = _CanSlideChartState;
}
