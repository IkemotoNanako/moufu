import 'package:moufu/infrastructure/data/body_data.dart';
import 'package:moufu/infrastructure/repository/health_repository.dart';
import 'package:moufu/infrastructure/repository/realm_repository.dart';
import 'package:moufu/infrastructure/repository/body_data_repository.dart';
import 'package:realm/realm.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'repository_providers.g.dart';

@riverpod
RealmRepository realmRepository(RealmRepositoryRef ref) {
  final config = Configuration.local(
      [BodyWeightData.schema, BodyFatPercentageData.schema]);
  final realm = Realm(config);
  return RealmRepository(realm);
}

@riverpod
BodyDataRepository bodyDataRepository(BodyDataRepositoryRef ref) {
  return BodyDataRepository(ref.read(realmRepositoryProvider).realm);
}

@riverpod
HealthRepository healthRepository(HealthRepositoryRef ref) {
  return HealthRepository();
}
