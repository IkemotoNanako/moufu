import 'package:moufu/domain/chart_model.dart';
import 'package:moufu/infrastructure/repository/body_data_repository.dart';

class SaveBodyDataUseCase {
  final BodyDataRepository _bodyDataRepository;

  SaveBodyDataUseCase(this._bodyDataRepository);

  void saveBodyWeight(BodyWeightDataModel bodyData) {
    final bodyWeightDataList = _bodyDataRepository.getBodyWeight();
    try {
      final bodyWeightData = bodyWeightDataList
          .firstWhere((element) => element.date == bodyData.date);
      _bodyDataRepository.deleteBodyWeight(bodyWeightData);
      _bodyDataRepository.saveBodyWeight(bodyData);
    } catch (e) {
      _bodyDataRepository.saveBodyWeight(bodyData);
    }
  }

  void saveBodyFatPercentage(BodyFatPercentageDataModel bodyData) {
    final bodyFatPercentageDataList =
        _bodyDataRepository.getBodyFatPercentageData();
    try {
      final bodyFatPercentageData = bodyFatPercentageDataList
          .firstWhere((element) => element.date == bodyData.date);
      _bodyDataRepository.deleteBodyFatPercentage(bodyFatPercentageData);
      _bodyDataRepository.saveBodyFatPercentage(bodyData);
    } catch (e) {
      _bodyDataRepository.saveBodyFatPercentage(bodyData);
    }
  }
}
