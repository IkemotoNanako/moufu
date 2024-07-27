import 'package:moufu/domain/chart_model.dart';

List<BodyWeightDataModel> generateAverageBodyWeight(
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
    double averageWeight =
        twoWeeksData.fold(0, (sum, data) => sum + (data.weight * 100).toInt()) /
            twoWeeksData.length /
            100;

    // 平均データをリストに追加
    averageData.add(BodyWeightDataModel(date: endDate, weight: averageWeight));
  }

  return averageData;
}

List<BodyFatPercentageDataModel> generateAverageBodyFatPercentage(
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
