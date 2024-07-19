import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:moufu/domain/graph_data.dart';

part 'graph_page_state.freezed.dart';

@freezed
class GraphPageState with _$GraphPageState {
  const factory GraphPageState({
    required List<BodyWeightData> bodyWeightData,
    required List<BodyFatPercentageData> bodyFatPercentageData,
  }) = _GraphPageState;
}
