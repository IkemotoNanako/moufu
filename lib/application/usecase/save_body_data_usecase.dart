import 'package:health/health.dart';
import 'package:moufu/domain/chart_model.dart';
import 'package:moufu/infrastructure/repository/health_repository.dart';

class SaveBodyDataUseCase {
  final HealthRepository _healthRepository;

  SaveBodyDataUseCase(this._healthRepository);

  Future<bool> saveBodyWeight({
    required BodyWeightDataModel bodyData,
  }) async {
    final success = await _healthRepository.saveHealthDataPoint(
        bodyData.weight, HealthDataType.WEIGHT, bodyData.date);
    return success;
  }

  Future<bool> saveBodyFatPercentage({
    required BodyFatPercentageDataModel bodyData,
  }) async {
    final success = await _healthRepository.saveHealthDataPoint(
        bodyData.bodyFatPercentage / 100,
        HealthDataType.BODY_FAT_PERCENTAGE,
        bodyData.date);
    return success;
  }
}
