import 'package:moufu/application/providers/usecase_providers.dart';
import 'package:moufu/domain/chart_model.dart';
import 'package:moufu/ui/state/can_slide_chart_state.dart';
import 'package:moufu/ui/utils/get_average_data.dart';
import 'package:moufu/ui/utils/get_latest_data.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'can_slide_chart_controller.g.dart';

@riverpod
class CanSlideChartController extends _$CanSlideChartController {
  @override
  FutureOr<CanSlideChartState> build() async {
    await ref.watch(permissionUsecaseProvider).checkAndRequestPermissions();

    final bodyWeightDataList =
        await ref.watch(getBodyDataUseCaseProvider).getBodyWeight();
    final bodyFatPercentageDataList =
        await ref.watch(getBodyDataUseCaseProvider).getBodyFatPercentage();

    bodyWeightDataList.sort((a, b) => a.date.compareTo(b.date));
    bodyFatPercentageDataList.sort((a, b) => a.date.compareTo(b.date));

    return CanSlideChartState(
      bodyWeightData: bodyWeightDataList,
      bodyFatPercentageData: bodyFatPercentageDataList,
      averageBodyWeightData: generateAverageBodyWeight(bodyWeightDataList),
      averageBodyFatPercentageData:
          generateAverageBodyFatPercentage(bodyFatPercentageDataList),
      rangeType: DateRangeType.week,
      latestWeight: getLatestBodyWeight(bodyWeightDataList).weight,
      latestBodyFatPercentage:
          getLatestBodyFatPercentage(bodyFatPercentageDataList)
              .bodyFatPercentage,
      asyncValue: const AsyncValue.data(null),
    );
  }

  Future<void> updateData() async {
    state = await AsyncValue.guard(() async {
      final bodyWeightDataList =
          await ref.read(getBodyDataUseCaseProvider).getBodyWeight();
      final bodyFatPercentageDataList =
          await ref.read(getBodyDataUseCaseProvider).getBodyFatPercentage();

      bodyWeightDataList.sort((a, b) => a.date.compareTo(b.date));
      bodyFatPercentageDataList.sort((a, b) => a.date.compareTo(b.date));

      return state.value!.copyWith(
        bodyWeightData: bodyWeightDataList,
        bodyFatPercentageData: bodyFatPercentageDataList,
        averageBodyWeightData: generateAverageBodyWeight(bodyWeightDataList),
        averageBodyFatPercentageData:
            generateAverageBodyFatPercentage(bodyFatPercentageDataList),
        latestWeight: getLatestBodyWeight(bodyWeightDataList).weight,
        latestBodyFatPercentage:
            getLatestBodyFatPercentage(bodyFatPercentageDataList)
                .bodyFatPercentage,
      );
    });
  }

  Future<void> changeRangeType(DateRangeType rangeType) async {
    state = await AsyncValue.guard(() async {
      return state.value!.copyWith(rangeType: rangeType);
    });
  }
}
