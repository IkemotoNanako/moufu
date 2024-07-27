import 'package:health/health.dart';
import 'package:moufu/domain/chart_model.dart';
import 'package:moufu/infrastructure/repository/body_data_repository.dart';
import 'package:moufu/infrastructure/repository/health_repository.dart';

class SaveBodyDataUseCase {
  final BodyDataRepository _bodyDataRepository;
  final HealthRepository _healthRepository;

  SaveBodyDataUseCase(this._bodyDataRepository, this._healthRepository);

  Future<void> saveBodyWeight(
      {required BodyWeightDataModel bodyData,
      required BodyWeightDataModel? oldData}) async {
    await _healthRepository.saveHealthDataPoint(
        bodyData.weight, HealthDataType.WEIGHT, bodyData.date);
    if (oldData != null) {
      _bodyDataRepository.deleteBodyWeight(oldData);
    }
    _bodyDataRepository.saveBodyWeight(BodyWeightDataModel(
        date: DateTime(
            bodyData.date.year, bodyData.date.month, bodyData.date.day),
        weight: bodyData.weight));
  }

  Future<void> saveBodyFatPercentage(
      {required BodyFatPercentageDataModel bodyData,
      required BodyFatPercentageDataModel? oldData}) async {
    await _healthRepository.saveHealthDataPoint(
        bodyData.bodyFatPercentage / 100,
        HealthDataType.BODY_FAT_PERCENTAGE,
        bodyData.date);
    if (oldData != null) {
      _bodyDataRepository.deleteBodyFatPercentage(oldData);
    }
    _bodyDataRepository.saveBodyFatPercentage(BodyFatPercentageDataModel(
        date: DateTime(
            bodyData.date.year, bodyData.date.month, bodyData.date.day),
        bodyFatPercentage: bodyData.bodyFatPercentage));
  }
}
