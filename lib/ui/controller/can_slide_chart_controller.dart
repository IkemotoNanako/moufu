import 'package:moufu/application/providers/usecase_providers.dart';
import 'package:moufu/domain/chart_model.dart';
import 'package:moufu/ui/state/can_slide_chart_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'can_slide_chart_controller.g.dart';

@riverpod
class CanSlideChartController extends _$CanSlideChartController {
  @override
  CanSlideChartState build() {
    final bodyWeightDataList =
        ref.watch(getBodyDataUseCaseProvider).getBodyWeight();
    final bodyFatPercentageDataList =
        ref.watch(getBodyDataUseCaseProvider).getBodyFatPercentage();
    return CanSlideChartState(
      bodyWeightData: bodyWeightDataList,
      bodyFatPercentageData: bodyFatPercentageDataList,
      averageBodyWeightData: _generateAverageBodyWeight(bodyWeightDataList),
      averageBodyFatPercentageData:
          _generateAverageBodyFatPercentage(bodyFatPercentageDataList),
      rangeType: DateRangeType.week,
      latestWeight: _getLatestBodyWeight(bodyWeightDataList).weight,
      latestBodyFatPercentage:
          _getLatestBodyFatPercentage(bodyFatPercentageDataList)
              .bodyFatPercentage,
    );
  }

  void changeRangeType(DateRangeType rangeType) {
    state = state.copyWith(rangeType: rangeType);
  }

  BodyWeightDataModel _getLatestBodyWeight(
      List<BodyWeightDataModel> bodyWeightData) {
    final list = bodyWeightData;
    list.sort((a, b) => b.date.compareTo(a.date));
    return list.firstOrNull ??
        BodyWeightDataModel(date: DateTime.now(), weight: 70);
  }

  BodyFatPercentageDataModel _getLatestBodyFatPercentage(
      List<BodyFatPercentageDataModel> bodyFatPercentageData) {
    final list = bodyFatPercentageData;
    list.sort((a, b) => b.date.compareTo(a.date));
    return list.firstOrNull ??
        BodyFatPercentageDataModel(date: DateTime.now(), bodyFatPercentage: 30);
  }

  List<BodyWeightDataModel> _generateAverageBodyWeight(
      List<BodyWeightDataModel> bodyWeightData) {
    List<BodyWeightDataModel> averageData = [];

    for (int i = 0; i < bodyWeightData.length; i++) {
      DateTime endDate = bodyWeightData[i].date;
      DateTime startDate = endDate.subtract(const Duration(days: 14));

      // 2週間前までのデータをフィルタリング
      List<BodyWeightDataModel> twoWeeksData = bodyWeightData
          .where((data) =>
              data.date.isAfter(startDate) &&
              data.date.isBefore(endDate.add(const Duration(days: 1))))
          .toList();

      // 平均を計算
      double averageWeight = twoWeeksData.fold(
              0, (sum, data) => sum + (data.weight * 100).toInt()) /
          twoWeeksData.length /
          100;

      // 平均データをリストに追加
      averageData
          .add(BodyWeightDataModel(date: endDate, weight: averageWeight));
    }

    return averageData;
  }

  List<BodyFatPercentageDataModel> _generateAverageBodyFatPercentage(
      List<BodyFatPercentageDataModel> bodyFatPercentageData) {
    List<BodyFatPercentageDataModel> averageData = [];

    for (int i = 0; i < bodyFatPercentageData.length; i++) {
      DateTime endDate = bodyFatPercentageData[i].date;
      DateTime startDate = endDate.subtract(const Duration(days: 14));

      // 2週間前までのデータをフィルタリング
      List<BodyFatPercentageDataModel> twoWeeksData = bodyFatPercentageData
          .where((data) =>
              data.date.isAfter(startDate) &&
              data.date.isBefore(endDate.add(const Duration(days: 1))))
          .toList();

      // 平均を計算
      double averageBodyFatPercentage = twoWeeksData.fold(
              0, (sum, data) => sum + (data.bodyFatPercentage * 100).toInt()) /
          twoWeeksData.length /
          100;

      // 平均データをリストに追加
      averageData.add(BodyFatPercentageDataModel(
          date: endDate, bodyFatPercentage: averageBodyFatPercentage));
    }

    return averageData;
  }
}
