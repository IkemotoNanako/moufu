import 'package:moufu/domain/chart_data.dart';
import 'package:moufu/ui/state/can_slide_chart_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'can_slide_chart_controller.g.dart';

@riverpod
class CanSlideChartController extends _$CanSlideChartController {
  @override
  CanSlideChartState build() {
    return CanSlideChartState(
      bodyWeightData: tmpBodyWeightData,
      bodyFatPercentageData: tmpBodyFatPercentageData,
      averageBodyWeightData: _generateAverageBodyWeight(tmpBodyWeightData),
      averageBodyFatPercentageData:
          _generateAverageBodyFatPercentage(tmpBodyFatPercentageData),
      rangeType: DateRangeType.week,
      latestWeight: _getLatestBodyWeight(tmpBodyWeightData).weight,
      latestBodyFatPercentage:
          _getLatestBodyFatPercentage(tmpBodyFatPercentageData)
              .bodyFatPercentage,
    );
  }

  void changeRangeType(DateRangeType rangeType) {
    state = state.copyWith(rangeType: rangeType);
  }

  BodyWeightData _getLatestBodyWeight(List<BodyWeightData> bodyWeightData) {
    final list = bodyWeightData;
    list.sort((a, b) => b.date.compareTo(a.date));
    return list.first;
  }

  BodyFatPercentageData _getLatestBodyFatPercentage(
      List<BodyFatPercentageData> bodyFatPercentageData) {
    final list = bodyFatPercentageData;
    list.sort((a, b) => b.date.compareTo(a.date));
    return list.first;
  }

  DateTime getEarlyBodyWeight(List<BodyWeightData> bodyWeightData) {
    bodyWeightData.sort((a, b) => a.date.compareTo(b.date));
    return bodyWeightData.first.date;
  }

  List<BodyWeightData> _generateAverageBodyWeight(
      List<BodyWeightData> bodyWeightData) {
    List<BodyWeightData> averageData = [];

    for (int i = 0; i < bodyWeightData.length; i++) {
      DateTime endDate = bodyWeightData[i].date;
      DateTime startDate = endDate.subtract(const Duration(days: 14));

      // 2週間前までのデータをフィルタリング
      List<BodyWeightData> twoWeeksData = bodyWeightData
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
      averageData.add(BodyWeightData(date: endDate, weight: averageWeight));
    }

    return averageData;
  }

  List<BodyFatPercentageData> _generateAverageBodyFatPercentage(
      List<BodyFatPercentageData> bodyFatPercentageData) {
    List<BodyFatPercentageData> averageData = [];

    for (int i = 0; i < bodyFatPercentageData.length; i++) {
      DateTime endDate = bodyFatPercentageData[i].date;
      DateTime startDate = endDate.subtract(const Duration(days: 14));

      // 2週間前までのデータをフィルタリング
      List<BodyFatPercentageData> twoWeeksData = bodyFatPercentageData
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
      averageData.add(BodyFatPercentageData(
          date: endDate, bodyFatPercentage: averageBodyFatPercentage));
    }

    return averageData;
  }
}

final tmpBodyWeightData = [
  BodyWeightData(date: DateTime(2024, 7, 11), weight: 70.2),
  BodyWeightData(date: DateTime(2024, 7, 12), weight: 70.3),
  BodyWeightData(date: DateTime(2024, 7, 13), weight: 70.4),
  BodyWeightData(date: DateTime(2024, 7, 14), weight: 70.5),
  BodyWeightData(date: DateTime(2024, 7, 18), weight: 70.9),
  BodyWeightData(date: DateTime(2024, 7, 19), weight: 71.0),
  BodyWeightData(date: DateTime(2024, 7, 15), weight: 70.6),
  BodyWeightData(date: DateTime(2024, 7, 16), weight: 70.7),
  BodyWeightData(date: DateTime(2024, 7, 17), weight: 70.8),
];

final tmpBodyFatPercentageData = [
  BodyFatPercentageData(date: DateTime(2024, 7, 11), bodyFatPercentage: 20.2),
  BodyFatPercentageData(date: DateTime(2024, 7, 12), bodyFatPercentage: 20.3),
  BodyFatPercentageData(date: DateTime(2024, 7, 13), bodyFatPercentage: 20.4),
  BodyFatPercentageData(date: DateTime(2024, 7, 17), bodyFatPercentage: 20.8),
  BodyFatPercentageData(date: DateTime(2024, 7, 19), bodyFatPercentage: 21.0),
  BodyFatPercentageData(date: DateTime(2024, 7, 18), bodyFatPercentage: 20.9),
  BodyFatPercentageData(date: DateTime(2024, 7, 14), bodyFatPercentage: 20.5),
  BodyFatPercentageData(date: DateTime(2024, 7, 15), bodyFatPercentage: 20.6),
  BodyFatPercentageData(date: DateTime(2024, 7, 16), bodyFatPercentage: 20.7),
];
