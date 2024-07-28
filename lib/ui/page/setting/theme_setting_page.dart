import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:moufu/domain/chart_model.dart';
import 'package:moufu/domain/theme_type.dart';
import 'package:moufu/ui/utils/theme_controller.dart';

class ThemeSettingPage extends ConsumerWidget {
  const ThemeSettingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(themeControllerProvider);
    final notifier = ref.read(themeControllerProvider.notifier);
    return Scaffold(
      appBar: AppBar(
        title: const Text('カラーテーマ設定'),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 16, bottom: 32),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                        icon: const Icon(Icons.arrow_back_ios),
                        onPressed: () {
                          notifier.previous();
                        }),
                    Text(ThemeType.fromEnumToString(state),
                        style: const TextStyle(fontSize: 20)),
                    IconButton(
                        icon: const Icon(Icons.arrow_forward_ios),
                        onPressed: () {
                          notifier.next();
                        }),
                  ],
                ),
              ),
              const Expanded(
                child: Stack(
                  children: [
                    _SampleWightChart(),
                    _SampleFatPercentageChart(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SampleWightChart extends StatelessWidget {
  const _SampleWightChart();

  @override
  Widget build(BuildContext context) {
    final themeScheme = Theme.of(context).colorScheme;
    return LineChart(
      LineChartData(
        titlesData: FlTitlesData(
          rightTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 30,
              getTitlesWidget: (value, meta) {
                return SideTitleWidget(
                  axisSide: meta.axisSide,
                  child: const SizedBox.shrink(),
                );
              },
            ),
          ),
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 40,
              interval: 5,
              getTitlesWidget: (value, meta) {
                return SideTitleWidget(
                  axisSide: meta.axisSide,
                  space: 8,
                  child: Text(
                    value.toInt().toString(),
                  ),
                );
              },
            ),
          ),
          topTitles: const AxisTitles(
            sideTitles: SideTitles(
              showTitles: false,
            ),
          ),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 30,
              getTitlesWidget: (value, meta) {
                return SideTitleWidget(
                  axisSide: meta.axisSide,
                  child: const SizedBox.shrink(),
                );
              },
            ),
          ),
        ),
        borderData: FlBorderData(show: false),
        maxY: 70,
        minY: 50,
        baselineX: DateTime(2024, 1, 1).millisecondsSinceEpoch.toDouble(),
        minX: DateTime(2024, 1, 1).millisecondsSinceEpoch.toDouble(),
        maxX: DateTime(2024, 1, 20).millisecondsSinceEpoch.toDouble(),
        gridData: const FlGridData(show: false),
        lineTouchData: const LineTouchData(enabled: false),
        lineBarsData: [
          LineChartBarData(
            spots: sampleWeightList
                .map((data) => FlSpot(
                    data.date.millisecondsSinceEpoch.toDouble(), data.weight))
                .toList(),
            color: themeScheme.inversePrimary,
            isCurved: true,
            barWidth: 2,
            dotData: FlDotData(
              show: true,
              getDotPainter: (spot, percent, barData, index) {
                return FlDotCirclePainter(
                  radius: 4,
                  color: themeScheme.inversePrimary,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _SampleFatPercentageChart extends StatelessWidget {
  const _SampleFatPercentageChart();

  @override
  Widget build(BuildContext context) {
    final themeScheme = Theme.of(context).colorScheme;
    return LineChart(
      LineChartData(
        titlesData: FlTitlesData(
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 30,
              getTitlesWidget: (value, meta) {
                return SideTitleWidget(
                  axisSide: meta.axisSide,
                  child: const SizedBox.shrink(),
                );
              },
            ),
          ),
          rightTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 40,
              interval: 2,
              getTitlesWidget: (value, meta) {
                return SideTitleWidget(
                  axisSide: meta.axisSide,
                  space: 8,
                  child: Text(
                    value.toInt().toString(),
                  ),
                );
              },
            ),
          ),
          topTitles: const AxisTitles(
            sideTitles: SideTitles(
              showTitles: false,
            ),
          ),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              interval: 24 * 60 * 60 * 1000.toDouble() * 6,
              reservedSize: 30,
              getTitlesWidget: (value, meta) {
                final date = DateTime.fromMillisecondsSinceEpoch(value.toInt());
                final formattedDate = DateFormat('MM/dd').format(date);
                return SideTitleWidget(
                  axisSide: meta.axisSide,
                  child: Text(formattedDate),
                );
              },
            ),
          ),
        ),
        gridData: FlGridData(
          show: true,
          drawHorizontalLine: false,
          drawVerticalLine: true,
          verticalInterval: 24 * 60 * 60 * 1000.toDouble() * 6,
        ),
        borderData: FlBorderData(show: false),
        maxY: 36,
        minY: 26,
        baselineX: DateTime(2024, 1, 1).millisecondsSinceEpoch.toDouble(),
        minX: DateTime(2024, 1, 1).millisecondsSinceEpoch.toDouble(),
        maxX: DateTime(2024, 1, 20).millisecondsSinceEpoch.toDouble(),
        lineTouchData: const LineTouchData(enabled: false),
        lineBarsData: [
          LineChartBarData(
            spots: sampleBodyFatPercentageList
                .map((data) => FlSpot(
                    data.date.millisecondsSinceEpoch.toDouble(),
                    data.bodyFatPercentage))
                .toList(),
            color: themeScheme.tertiaryContainer,
            isCurved: true,
            barWidth: 2,
            dotData: FlDotData(
              show: true,
              getDotPainter: (spot, percent, barData, index) {
                return FlDotCirclePainter(
                  radius: 4,
                  color: themeScheme.tertiaryContainer,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

final List<BodyWeightDataModel> sampleWeightList = [
  BodyWeightDataModel(date: DateTime(2024, 1, 1), weight: 60.5),
  BodyWeightDataModel(date: DateTime(2024, 1, 2), weight: 60.6),
  BodyWeightDataModel(date: DateTime(2024, 1, 3), weight: 60.4),
  BodyWeightDataModel(date: DateTime(2024, 1, 4), weight: 60.2),
  BodyWeightDataModel(date: DateTime(2024, 1, 5), weight: 60.1),
  BodyWeightDataModel(date: DateTime(2024, 1, 6), weight: 60.4),
  BodyWeightDataModel(date: DateTime(2024, 1, 7), weight: 60.1),
  BodyWeightDataModel(date: DateTime(2024, 1, 8), weight: 59.7),
  BodyWeightDataModel(date: DateTime(2024, 1, 9), weight: 59.9),
  BodyWeightDataModel(date: DateTime(2024, 1, 10), weight: 59.8),
  BodyWeightDataModel(date: DateTime(2024, 1, 11), weight: 59.6),
  BodyWeightDataModel(date: DateTime(2024, 1, 12), weight: 59.7),
  BodyWeightDataModel(date: DateTime(2024, 1, 13), weight: 59.6),
  BodyWeightDataModel(date: DateTime(2024, 1, 14), weight: 59.5),
  BodyWeightDataModel(date: DateTime(2024, 1, 15), weight: 59.4),
  BodyWeightDataModel(date: DateTime(2024, 1, 16), weight: 59.4),
  BodyWeightDataModel(date: DateTime(2024, 1, 17), weight: 59.3),
  BodyWeightDataModel(date: DateTime(2024, 1, 18), weight: 59.1),
  BodyWeightDataModel(date: DateTime(2024, 1, 19), weight: 59.2),
  BodyWeightDataModel(date: DateTime(2024, 1, 20), weight: 59.0),
];
final List<BodyFatPercentageDataModel> sampleBodyFatPercentageList = [
  BodyFatPercentageDataModel(
      date: DateTime(2024, 1, 1), bodyFatPercentage: 30.5),
  BodyFatPercentageDataModel(
      date: DateTime(2024, 1, 2), bodyFatPercentage: 30.6),
  BodyFatPercentageDataModel(
      date: DateTime(2024, 1, 3), bodyFatPercentage: 30.4),
  BodyFatPercentageDataModel(
      date: DateTime(2024, 1, 4), bodyFatPercentage: 30.2),
  BodyFatPercentageDataModel(
      date: DateTime(2024, 1, 5), bodyFatPercentage: 30.1),
  BodyFatPercentageDataModel(
      date: DateTime(2024, 1, 6), bodyFatPercentage: 30.4),
  BodyFatPercentageDataModel(
      date: DateTime(2024, 1, 7), bodyFatPercentage: 30.1),
  BodyFatPercentageDataModel(
      date: DateTime(2024, 1, 8), bodyFatPercentage: 29.7),
  BodyFatPercentageDataModel(
      date: DateTime(2024, 1, 9), bodyFatPercentage: 29.9),
  BodyFatPercentageDataModel(
      date: DateTime(2024, 1, 10), bodyFatPercentage: 29.8),
  BodyFatPercentageDataModel(
      date: DateTime(2024, 1, 11), bodyFatPercentage: 29.6),
  BodyFatPercentageDataModel(
      date: DateTime(2024, 1, 12), bodyFatPercentage: 29.7),
  BodyFatPercentageDataModel(
      date: DateTime(2024, 1, 13), bodyFatPercentage: 29.6),
  BodyFatPercentageDataModel(
      date: DateTime(2024, 1, 14), bodyFatPercentage: 29.5),
  BodyFatPercentageDataModel(
      date: DateTime(2024, 1, 15), bodyFatPercentage: 29.4),
  BodyFatPercentageDataModel(
      date: DateTime(2024, 1, 16), bodyFatPercentage: 29.4),
  BodyFatPercentageDataModel(
      date: DateTime(2024, 1, 17), bodyFatPercentage: 29.3),
  BodyFatPercentageDataModel(
      date: DateTime(2024, 1, 18), bodyFatPercentage: 29.1),
  BodyFatPercentageDataModel(
      date: DateTime(2024, 1, 19), bodyFatPercentage: 29.2),
  BodyFatPercentageDataModel(
      date: DateTime(2024, 1, 20), bodyFatPercentage: 29.0),
];
