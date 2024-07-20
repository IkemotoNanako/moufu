import 'package:moufu/domain/body_data_model.dart';
import 'package:moufu/infrastructure/data/body_data.dart';
import 'package:realm/realm.dart';

class BodyDataRepository {
  final Realm _realm;
  BodyDataRepository(this._realm);

  void addRecord(BodyDataModel bodyDataModel) {
    _realm.write(() {
      _realm.add(
        BodyData(
          bodyDataModel.bodyWeight,
          bodyDataModel.bodyFatPercentage,
          bodyDataModel.date,
        ),
      );
    });
  }

  List<BodyDataModel> getBodyData() {
    final results = _realm.all<BodyData>();
    return results.map((bodyData) {
      return BodyDataModel(
        bodyWeight: bodyData.bodyWeight,
        bodyFatPercentage: bodyData.bodyFatPercentage,
        date: bodyData.date,
      );
    }).toList();
  }
}
