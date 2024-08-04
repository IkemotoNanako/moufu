import 'package:health/health.dart';
import 'package:moufu/domain/chart_model.dart';
import 'package:moufu/infrastructure/repository/health_repository.dart';

class GetBodyDataUseCase {
  final HealthRepository _healthRepository;

  GetBodyDataUseCase(this._healthRepository);

  Future<List<BodyWeightDataModel>> getBodyWeight() async {
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
    return bodyWeightData;
  }

  Future<List<BodyFatPercentageDataModel>> getBodyFatPercentage() async {
    final healthDataPoints = await _healthRepository
        .getHealthDataPoints(HealthDataType.BODY_FAT_PERCENTAGE);
    final bodyFatPercentageData = healthDataPoints
        .where((element) => element.type == HealthDataType.BODY_FAT_PERCENTAGE)
        .map((data) => BodyFatPercentageDataModel(
              date: DateTime(
                  data.dateFrom.year, data.dateFrom.month, data.dateFrom.day),
              bodyFatPercentage:
                  (data.value as NumericHealthValue).numericValue.toDouble() *
                      100,
            ))
        .toList();
    return bodyFatPercentageData;
  }
}
