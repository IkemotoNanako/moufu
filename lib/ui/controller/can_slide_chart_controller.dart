import 'package:moufu/domain/chart_data.dart';
import 'package:moufu/ui/state/can_slide_chart_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'can_slide_chart_controller.g.dart';

@riverpod
class CanSlideChartController extends _$CanSlideChartController {
  @override
  CanSlideChartState build() {
    return CanSlideChartState(
      bodyWeightData: [
        BodyWeightData(date: DateTime(2024, 7, 11), weight: 70.2),
        BodyWeightData(date: DateTime(2024, 7, 12), weight: 70.3),
        BodyWeightData(date: DateTime(2024, 7, 13), weight: 70.4),
        BodyWeightData(date: DateTime(2024, 7, 14), weight: 70.5),
        BodyWeightData(date: DateTime(2024, 7, 15), weight: 70.6),
        BodyWeightData(date: DateTime(2024, 7, 16), weight: 70.7),
        BodyWeightData(date: DateTime(2024, 7, 17), weight: 70.8),
        BodyWeightData(date: DateTime(2024, 7, 18), weight: 70.9),
        BodyWeightData(date: DateTime(2024, 7, 19), weight: 71.0),
      ],
      bodyFatPercentageData: [
        BodyFatPercentageData(
            date: DateTime(2024, 7, 11), bodyFatPercentage: 20.2),
        BodyFatPercentageData(
            date: DateTime(2024, 7, 12), bodyFatPercentage: 20.3),
        BodyFatPercentageData(
            date: DateTime(2024, 7, 13), bodyFatPercentage: 20.4),
        BodyFatPercentageData(
            date: DateTime(2024, 7, 14), bodyFatPercentage: 20.5),
        BodyFatPercentageData(
            date: DateTime(2024, 7, 15), bodyFatPercentage: 20.6),
        BodyFatPercentageData(
            date: DateTime(2024, 7, 16), bodyFatPercentage: 20.7),
        BodyFatPercentageData(
            date: DateTime(2024, 7, 17), bodyFatPercentage: 20.8),
        BodyFatPercentageData(
            date: DateTime(2024, 7, 18), bodyFatPercentage: 20.9),
        BodyFatPercentageData(
            date: DateTime(2024, 7, 19), bodyFatPercentage: 21.0),
      ],
      rangeType: DateRangeType.week,
    );
  }

  void changeRangeType(DateRangeType rangeType) {
    state = state.copyWith(rangeType: rangeType);
  }
}
