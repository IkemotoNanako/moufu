import 'package:realm/realm.dart';

part 'body_data.realm.dart';

@RealmModel()
class _BodyWeightData {
  late double bodyWeight;
  late DateTime date;
}

@RealmModel()
class _BodyFatPercentageData {
  late double bodyFatPercentage;
  late DateTime date;
}
