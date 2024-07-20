import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_modal_state.freezed.dart';

@freezed
class AddModalState with _$AddModalState {
  const factory AddModalState({
    required double bodyWeight,
    required double? bodyFatPercentage,
    required DateTime date,
  }) = _AddModelState;
}
