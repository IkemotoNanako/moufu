import 'package:realm/realm.dart';

part 'body_data.realm.dart';

@RealmModel()
class _BodyData {
  late double bodyWeight;
  late double bodyFatPercentage;
  late DateTime date;
}
