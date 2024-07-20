import 'package:flutter/material.dart';
import 'package:moufu/application/providers/usecase_providers.dart';
import 'package:moufu/domain/chart_model.dart';
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

  final TextEditingController bodyWeightController = TextEditingController();
  final TextEditingController bodyFatPercentageController =
      TextEditingController();

  void changeDate(DateTime date) {
    state = state.copyWith(date: date);
  }

  void saveData() {
    state = state.copyWith(
      bodyWeight: double.parse(bodyWeightController.text),
      bodyFatPercentage: bodyFatPercentageController.text.isNotEmpty
          ? double.parse(bodyFatPercentageController.text)
          : null,
    );
    ref.read(saveBodyDataUseCaseProvider).saveBodyWeight(
        BodyWeightDataModel(weight: state.bodyWeight, date: state.date));
    if (state.bodyFatPercentage != null) {
      ref.read(saveBodyDataUseCaseProvider).saveBodyFatPercentage(
          BodyFatPercentageDataModel(
              bodyFatPercentage: state.bodyFatPercentage!, date: state.date));
    }
    ref.invalidate(getBodyDataUseCaseProvider);
  }
}
