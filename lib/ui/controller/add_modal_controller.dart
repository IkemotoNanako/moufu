import 'package:moufu/application/providers/usecase_providers.dart';
import 'package:moufu/domain/body_data_model.dart';
import 'package:moufu/ui/state/add_modal_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'add_modal_controller.g.dart';

@riverpod
class AddModalController extends _$AddModalController {
  @override
  AddModalState build() {
    return AddModalState(
      bodyWeight: 0,
      bodyFatPercentage: null,
      date: DateTime.now(),
    );
  }

  void changeBodyWeight(double bodyWeight) {
    state = state.copyWith(bodyWeight: bodyWeight);
  }

  void changeBodyFatPercentage(double bodyFatPercentage) {
    state = state.copyWith(bodyFatPercentage: bodyFatPercentage);
  }

  void changeDate(DateTime date) {
    state = state.copyWith(date: date);
  }

  void saveData() {
    ref.read(bodyWightDataUsecaseProvider).save(
        BodyWeightDataModel(bodyWeight: state.bodyWeight, date: state.date));
    if (state.bodyFatPercentage != null) {
      ref.read(bodyFatPercentageDataUsecaseProvider).save(
          BodyFatPercentageDataModel(
              bodyFatPercentage: state.bodyFatPercentage!, date: state.date));
    }
  }
}
