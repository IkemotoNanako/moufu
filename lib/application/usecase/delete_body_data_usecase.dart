import 'package:moufu/domain/chart_model.dart';
import 'package:moufu/infrastructure/repository/body_data_repository.dart';

class DeleteBodyDataUseCase {
  final BodyDataRepository _bodyDataRepository;

  DeleteBodyDataUseCase(this._bodyDataRepository);

  void deleteBodyWeight(BodyWeightDataModel bodyDataModel) {
    return _bodyDataRepository.deleteBodyWeight(bodyDataModel);
  }

  void deleteBodyFatPercentage(
      BodyFatPercentageDataModel fatPercentageDataModel) {
    return _bodyDataRepository.deleteBodyFatPercentage(fatPercentageDataModel);
  }
}
