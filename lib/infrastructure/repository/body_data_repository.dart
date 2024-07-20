import 'package:moufu/domain/chart_model.dart';
import 'package:moufu/infrastructure/data/body_data.dart';
import 'package:realm/realm.dart';

class BodyDataRepository {
  final Realm _realm;
  BodyDataRepository(this._realm);

  void saveBodyWeight(BodyWeightDataModel bodyDataModel) {
    _realm.write(() {
      _realm.add(
        BodyWeightData(
          bodyDataModel.weight,
          bodyDataModel.date,
        ),
      );
    });
  }

  void saveBodyFatPercentage(BodyFatPercentageDataModel bodyDataModel) {
    _realm.write(() {
      _realm.add(
        BodyFatPercentageData(
          bodyDataModel.bodyFatPercentage,
          bodyDataModel.date,
        ),
      );
    });
  }

  List<BodyWeightDataModel> getBodyData() {
    final results = _realm.all<BodyWeightData>();
    return results.map((bodyData) {
      return BodyWeightDataModel(
        weight: bodyData.bodyWeight,
        date: bodyData.date,
      );
    }).toList();
  }

  List<BodyFatPercentageDataModel> getBodyFatPercentageData() {
    final results = _realm.all<BodyFatPercentageData>();
    return results.map((bodyData) {
      return BodyFatPercentageDataModel(
        bodyFatPercentage: bodyData.bodyFatPercentage,
        date: bodyData.date,
      );
    }).toList();
  }
}
