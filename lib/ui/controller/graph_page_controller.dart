import 'package:moufu/domain/graph_data.dart';
import 'package:moufu/ui/state/graph_page_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'graph_page_controller.g.dart';

@riverpod
class GraphPageController extends _$GraphPageController {
  @override
  GraphPageState build() {
    return GraphPageState(
      bodyWeightData: [
        BodyWeightData(DateTime(2024, 7, 11), 70.2),
        BodyWeightData(DateTime(2024, 7, 12), 70.5),
        BodyWeightData(DateTime(2024, 7, 13), 70.4),
        BodyWeightData(DateTime(2024, 7, 14), 70.2),
        BodyWeightData(DateTime(2024, 7, 15), 70.3),
        BodyWeightData(DateTime(2024, 7, 16), 70.1),
        BodyWeightData(DateTime(2024, 7, 17), 70.0),
        BodyWeightData(DateTime(2024, 7, 18), 70.0),
        BodyWeightData(DateTime(2024, 7, 19), 70.0),
      ],
      bodyFatPercentageData: [
        BodyFatPercentageData(DateTime(2024, 7, 11), 20.0),
        BodyFatPercentageData(DateTime(2024, 7, 12), 20.1),
        BodyFatPercentageData(DateTime(2024, 7, 13), 20.2),
        BodyFatPercentageData(DateTime(2024, 7, 14), 20.3),
        BodyFatPercentageData(DateTime(2024, 7, 15), 20.4),
        BodyFatPercentageData(DateTime(2024, 7, 16), 20.5),
        BodyFatPercentageData(DateTime(2024, 7, 17), 20.6),
        BodyFatPercentageData(DateTime(2024, 7, 18), 20.7),
        BodyFatPercentageData(DateTime(2024, 7, 19), 20.8),
      ],
    );
  }
}
