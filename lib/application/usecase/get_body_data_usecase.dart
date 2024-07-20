import 'package:moufu/domain/chart_model.dart';
import 'package:moufu/infrastructure/repository/body_data_repository.dart';

class GetBodyDataUseCase {
  final BodyDataRepository _bodyDataRepository;

  GetBodyDataUseCase(this._bodyDataRepository);

  List<BodyWeightDataModel> getBodyWeight() {
    return _bodyDataRepository.getBodyWeight();
  }

  List<BodyFatPercentageDataModel> getBodyFatPercentage() {
    return _bodyDataRepository.getBodyFatPercentageData();
  }
}
