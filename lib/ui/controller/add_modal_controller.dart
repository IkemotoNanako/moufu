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
      date: DateTime.now(),
    );
  }

  final TextEditingController bodyWeightController = TextEditingController();
  final TextEditingController bodyFatPercentageController =
      TextEditingController();

  void changeDate(DateTime date) {
    state = state.copyWith(date: DateTime(date.year, date.month, date.day));
    final bodyWeightDataList =
        ref.read(getBodyDataUseCaseProvider).getBodyWeight();
    final bodyFatPercentageDataList =
        ref.read(getBodyDataUseCaseProvider).getBodyFatPercentage();

    try {
      final bodyWeightData = bodyWeightDataList.firstWhere((element) =>
          DateTime(element.date.year, element.date.month, element.date.day) ==
          DateTime(state.date.year, state.date.month, state.date.day).subtract(
            const Duration(days: 1),
          ));
      state = state.copyWith(oldBodyWeightDataModel: bodyWeightData);
      bodyWeightController.text = bodyWeightData.weight.toString();
    } catch (e) {
      bodyWeightController.text = '';
    }

    try {
      final bodyFatPercentageData = bodyFatPercentageDataList.firstWhere(
          (element) =>
              DateTime(
                  element.date.year, element.date.month, element.date.day) ==
              DateTime(state.date.year, state.date.month, state.date.day)
                  .subtract(
                const Duration(days: 1),
              ));
      state =
          state.copyWith(oldBodyFatPercentageDataModel: bodyFatPercentageData);
      bodyFatPercentageController.text =
          bodyFatPercentageData.bodyFatPercentage.toString();
    } catch (e) {
      bodyFatPercentageController.text = '';
    }
  }

  void saveData() {
    ref.read(saveBodyDataUseCaseProvider).saveBodyWeight(
          bodyData: BodyWeightDataModel(
            weight: double.parse(bodyWeightController.text),
            date: DateTime(state.date.year, state.date.month, state.date.day),
          ),
          oldData: state.oldBodyWeightDataModel,
        );
    if (bodyFatPercentageController.text.isNotEmpty) {
      ref.read(saveBodyDataUseCaseProvider).saveBodyFatPercentage(
            bodyData: BodyFatPercentageDataModel(
              bodyFatPercentage: double.parse(bodyFatPercentageController.text),
              date: DateTime(state.date.year, state.date.month, state.date.day),
            ),
            oldData: state.oldBodyFatPercentageDataModel,
          );
    }
    ref.invalidate(getBodyDataUseCaseProvider);
  }
}
