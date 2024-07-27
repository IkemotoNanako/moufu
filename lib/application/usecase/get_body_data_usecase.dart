import 'package:health/health.dart';
import 'package:moufu/domain/chart_model.dart';
import 'package:moufu/infrastructure/repository/body_data_repository.dart';
import 'package:moufu/infrastructure/repository/health_repository.dart';

class GetBodyDataUseCase {
  final BodyDataRepository _bodyDataRepository;
  final HealthRepository _healthRepository;

  GetBodyDataUseCase(this._bodyDataRepository, this._healthRepository);

  Future<List<BodyWeightDataModel>> getBodyWeight() async {
    try {
      final healthDataPoints =
          await _healthRepository.getHealthDataPoints(HealthDataType.WEIGHT);
      final bodyWeightData = healthDataPoints
          .where((element) => element.type == HealthDataType.WEIGHT)
          .map((data) => BodyWeightDataModel(
                date: DateTime(
                    data.dateFrom.year, data.dateFrom.month, data.dateFrom.day),
                weight:
                    (data.value as NumericHealthValue).numericValue.toDouble(),
              ))
          .toList();
      if (bodyWeightData.isEmpty) {
        return _bodyDataRepository.getBodyWeight();
      }
      return bodyWeightData;
    } on Exception {
      return _bodyDataRepository.getBodyWeight();
    }
  }

  Future<List<BodyFatPercentageDataModel>> getBodyFatPercentage() async {
    try {
      final healthDataPoints = await _healthRepository
          .getHealthDataPoints(HealthDataType.BODY_FAT_PERCENTAGE);
      final bodyFatPercentageData = healthDataPoints
          .where(
              (element) => element.type == HealthDataType.BODY_FAT_PERCENTAGE)
          .map((data) => BodyFatPercentageDataModel(
                date: DateTime(
                    data.dateFrom.year, data.dateFrom.month, data.dateFrom.day),
                bodyFatPercentage:
                    (data.value as NumericHealthValue).numericValue.toDouble() *
                        100,
              ))
          .toList();
      if (bodyFatPercentageData.isEmpty) {
        return _bodyDataRepository.getBodyFatPercentageData();
      }
      return bodyFatPercentageData;
    } on Exception {
      return _bodyDataRepository.getBodyFatPercentageData();
    }
  }
}
