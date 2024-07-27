import 'package:moufu/domain/chart_model.dart';

BodyWeightDataModel getLatestBodyWeight(
    List<BodyWeightDataModel> bodyWeightData) {
  final list = bodyWeightData;
  list.sort((a, b) => b.date.compareTo(a.date));
  return list.firstOrNull ??
      BodyWeightDataModel(date: DateTime.now(), weight: 70);
}

BodyFatPercentageDataModel getLatestBodyFatPercentage(
    List<BodyFatPercentageDataModel> bodyFatPercentageData) {
  final list = bodyFatPercentageData;
  list.sort((a, b) => b.date.compareTo(a.date));
  return list.firstOrNull ??
      BodyFatPercentageDataModel(date: DateTime.now(), bodyFatPercentage: 30);
}
