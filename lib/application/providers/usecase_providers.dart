import 'package:moufu/application/usecase/delete_body_data_usecase.dart';
import 'package:moufu/application/usecase/get_body_data_usecase.dart';
import 'package:moufu/application/usecase/save_body_data_usecase.dart';
import 'package:moufu/infrastructure/providers/repository_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'usecase_providers.g.dart';

@riverpod
GetBodyDataUseCase getBodyDataUseCase(GetBodyDataUseCaseRef ref) {
  return GetBodyDataUseCase(ref.read(bodyDataRepositoryProvider));
}

@riverpod
SaveBodyDataUseCase saveBodyDataUseCase(SaveBodyDataUseCaseRef ref) {
  return SaveBodyDataUseCase(ref.read(bodyDataRepositoryProvider));
}

@riverpod
DeleteBodyDataUseCase deleteBodyDataUseCase(DeleteBodyDataUseCaseRef ref) {
  return DeleteBodyDataUseCase(ref.read(bodyDataRepositoryProvider));
}
