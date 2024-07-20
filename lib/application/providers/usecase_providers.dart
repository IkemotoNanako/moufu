import 'package:moufu/application/usecase/body_data_usecase.dart';
import 'package:moufu/application/usecase/body_fat_percentage_usecase.dart';
import 'package:moufu/infrastructure/providers/repository_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'usecase_providers.g.dart';

@riverpod
BodyWightDataUsecase bodyWightDataUsecase(BodyWightDataUsecaseRef ref) {
  return BodyWightDataUsecase(ref.read(bodyDataRepositoryProvider));
}

@riverpod
BodyFatPercentageDataUsecase bodyFatPercentageDataUsecase(
    BodyFatPercentageDataUsecaseRef ref) {
  return BodyFatPercentageDataUsecase(ref.read(bodyDataRepositoryProvider));
}
