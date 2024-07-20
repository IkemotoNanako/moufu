import 'package:moufu/domain/chart_model.dart';
import 'package:moufu/infrastructure/repository/body_data_repository.dart';

class SaveBodyDataUseCase {
  final BodyDataRepository _bodyDataRepository;

  SaveBodyDataUseCase(this._bodyDataRepository);

  void saveBodyWeight(BodyWeightDataModel bodyData) {
    _bodyDataRepository.saveBodyWeight(bodyData);
  }

  void saveBodyFatPercentage(BodyFatPercentageDataModel bodyData) {
    _bodyDataRepository.saveBodyFatPercentage(bodyData);
  }
}
