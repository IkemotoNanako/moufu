import 'package:moufu/domain/body_data_model.dart';
import 'package:moufu/infrastructure/repository/body_data_repository.dart';

class BodyWightDataUsecase {
  final BodyDataRepository _bodyDataRepository;

  BodyWightDataUsecase(this._bodyDataRepository);

  List<BodyWeightDataModel> get() {
    return _bodyDataRepository.getBodyData();
  }

  void save(BodyWeightDataModel bodyData) {
    _bodyDataRepository.saveBodyWeight(bodyData);
  }
}
