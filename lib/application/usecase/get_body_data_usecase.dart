import 'package:moufu/domain/body_data_model.dart';
import 'package:moufu/infrastructure/repository/body_data_repository.dart';

class GetBodyDataUseCase {
  final BodyDataRepository _bodyDataRepository;

  GetBodyDataUseCase(this._bodyDataRepository);

  List<BodyWeightDataModel> getBodyWeight() {
    return _bodyDataRepository.getBodyData();
  }

  List<BodyFatPercentageDataModel> getBodyFatPercentage() {
    return _bodyDataRepository.getBodyFatPercentageData();
  }
}
