import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:moufu/domain/chart_model.dart';

part 'add_modal_state.freezed.dart';

@freezed
class AddModalState with _$AddModalState {
  const factory AddModalState({
    required DateTime date,
    BodyWeightDataModel? oldBodyWeightDataModel,
    BodyFatPercentageDataModel? oldBodyFatPercentageDataModel,
  }) = _AddModelState;
}
