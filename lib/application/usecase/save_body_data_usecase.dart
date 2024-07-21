import 'package:moufu/domain/chart_model.dart';
import 'package:moufu/infrastructure/repository/body_data_repository.dart';

class SaveBodyDataUseCase {
  final BodyDataRepository _bodyDataRepository;

  SaveBodyDataUseCase(this._bodyDataRepository);

  void saveBodyWeight(
      {required BodyWeightDataModel bodyData,
      required BodyWeightDataModel? oldData}) {
    if (oldData != null) {
      _bodyDataRepository.deleteBodyWeight(oldData);
    }
    _bodyDataRepository.saveBodyWeight(bodyData);
  }

  void saveBodyFatPercentage(
      {required BodyFatPercentageDataModel bodyData,
      required BodyFatPercentageDataModel? oldData}) {
    if (oldData != null) {
      _bodyDataRepository.deleteBodyFatPercentage(oldData);
    }
    _bodyDataRepository.saveBodyFatPercentage(bodyData);
  }
}
