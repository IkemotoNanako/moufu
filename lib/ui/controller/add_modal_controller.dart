import 'package:flutter/material.dart';
import 'package:moufu/application/providers/usecase_providers.dart';
import 'package:moufu/domain/chart_model.dart';
import 'package:moufu/ui/controller/can_slide_chart_controller.dart';
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

  Future<void> changeDate(DateTime date) async {
    state = state.copyWith(date: DateTime(date.year, date.month, date.day));
    final bodyWeightDataList =
        await ref.read(getBodyDataUseCaseProvider).getBodyWeight();
    final bodyFatPercentageDataList =
        await ref.read(getBodyDataUseCaseProvider).getBodyFatPercentage();

    try {
      final bodyWeightData = bodyWeightDataList.firstWhere((element) =>
          DateTime(element.date.year, element.date.month, element.date.day) ==
          DateTime(state.date.year, state.date.month, state.date.day).subtract(
            const Duration(days: 1),
          ));
      state = state.copyWith(oldBodyWeightDataModel: bodyWeightData);
      bodyWeightController.text = bodyWeightData.weight.toString();
    } catch (e) {
      state = state.copyWith(oldBodyWeightDataModel: null);
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
      state = state.copyWith(oldBodyFatPercentageDataModel: null);
    }
  }

  Future<void> saveData() async {
    await ref.read(saveBodyDataUseCaseProvider).saveBodyWeight(
          bodyData: BodyWeightDataModel(
            weight: double.parse(bodyWeightController.text),
            date: state.date,
          ),
          oldData: state.oldBodyWeightDataModel,
        );
    if (bodyFatPercentageController.text.isNotEmpty) {
      await ref.read(saveBodyDataUseCaseProvider).saveBodyFatPercentage(
            bodyData: BodyFatPercentageDataModel(
              bodyFatPercentage: double.parse(bodyFatPercentageController.text),
              date: state.date,
            ),
            oldData: state.oldBodyFatPercentageDataModel,
          );
    }
    await ref.read(canSlideChartControllerProvider.notifier).updateData();
    ref.invalidate(getBodyDataUseCaseProvider);
  }
}
