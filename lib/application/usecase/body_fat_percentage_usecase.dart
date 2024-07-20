import 'package:moufu/domain/body_data_model.dart';
import 'package:moufu/infrastructure/repository/body_data_repository.dart';

class BodyFatPercentageDataUsecase {
  final BodyDataRepository _bodyDataRepository;

  BodyFatPercentageDataUsecase(this._bodyDataRepository);

  List<BodyFatPercentageDataModel> get() {
    return _bodyDataRepository.getBodyFatPercentageData();
  }

  void save(BodyFatPercentageDataModel bodyData) {
    _bodyDataRepository.saveBodyFatPercentage(bodyData);
  }
}
