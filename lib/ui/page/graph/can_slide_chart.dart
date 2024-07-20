import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:moufu/domain/chart_data.dart';
import 'package:moufu/ui/controller/can_slide_chart_controller.dart';
import 'package:moufu/ui/state/can_slide_chart_state.dart';

class CanSlideChart extends ConsumerWidget {
  const CanSlideChart({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(canSlideChartControllerProvider);
    final notifier = ref.watch(canSlideChartControllerProvider.notifier);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _RangeSelectButton(
              text: '1週間',
              onPressed: () {
                notifier.changeRangeType(DateRangeType.week);
              },
              active: state.rangeType == DateRangeType.week,
            ),
            _RangeSelectButton(
              text: '1ヶ月',
              onPressed: () {
                notifier.changeRangeType(DateRangeType.month);
              },
              active: state.rangeType == DateRangeType.month,
            ),
            _RangeSelectButton(
              text: '3ヶ月',
              onPressed: () {
                notifier.changeRangeType(DateRangeType.threeMonths);
              },
              active: state.rangeType == DateRangeType.threeMonths,
            ),
            _RangeSelectButton(
              text: '6ヶ月',
              onPressed: () {
                notifier.changeRangeType(DateRangeType.year);
              },
              active: state.rangeType == DateRangeType.year,
            ),
          ],
        ),
        SizedBox.fromSize(
          size: const Size.fromHeight(16),
        ),
        Expanded(
          child: Stack(
            children: [
              _BodyWeightSideTitles(state: state),
              _BodyFatPercentageSlideTitles(state: state),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 2,
                  child: Stack(
                    children: [
                      _DateSlideTitles(state: state),
                      _AverageBodyWeightGraph(state: state),
                      _DailyBodyWeightGraph(state: state),
                      _AverageBodyFatPercentageGraph(state: state),
                      _DailyBodyFatPercentageGraph(state: state)
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _RangeSelectButton extends StatelessWidget {
  const _RangeSelectButton({
    required this.text,
    required this.onPressed,
    required this.active,
  });
  final String text;
  final VoidCallback onPressed;
  final bool active;

  @override
  Widget build(BuildContext context) {
    final themeScheme = Theme.of(context).colorScheme;
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor:
            active ? themeScheme.inversePrimary : Colors.transparent,
        foregroundColor:
            active ? themeScheme.onPrimary : themeScheme.inversePrimary,
        shadowColor: Colors.transparent,
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      ),
      child: Text(
        text,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}

class _BodyWeightSideTitles extends StatelessWidget {
  const _BodyWeightSideTitles({
    required this.state,
  });

  final CanSlideChartState state;

  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
        titlesData: FlTitlesData(
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
          rightTitles: const AxisTitles(
            sideTitles: SideTitles(
              showTitles: false,
            ),
          ),
          topTitles: const AxisTitles(
            sideTitles: SideTitles(
              showTitles: false,
            ),
          ),
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 40,
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
        ),
        borderData: FlBorderData(show: false),
        maxY: ((state.latestWeight + 30) / 5).ceil() * 5,
        minY: ((state.latestWeight - 10) / 5).ceil() * 5,
      ),
    );
  }
}

class _DateSlideTitles extends StatelessWidget {
  const _DateSlideTitles({
    required this.state,
  });

  final CanSlideChartState state;

  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
        titlesData: FlTitlesData(
          leftTitles: const AxisTitles(
            sideTitles: SideTitles(
              showTitles: false,
            ),
          ),
          rightTitles: const AxisTitles(
            sideTitles: SideTitles(
              showTitles: false,
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
              interval:
                  24 * 60 * 60 * 1000.toDouble() * state.rangeType.interval,
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
          verticalInterval:
              24 * 60 * 60 * 1000.toDouble() * state.rangeType.interval,
        ),
        borderData: FlBorderData(show: false),
        baselineX: DateTime(
                DateTime.now().year, DateTime.now().month, DateTime.now().day)
            .subtract(Duration(days: state.rangeType.range))
            .millisecondsSinceEpoch
            .toDouble(),
        minX: DateTime(
                DateTime.now().year, DateTime.now().month, DateTime.now().day)
            .subtract(Duration(days: state.rangeType.range))
            .millisecondsSinceEpoch
            .toDouble(),
        maxX: DateTime(
                DateTime.now().year, DateTime.now().month, DateTime.now().day)
            .millisecondsSinceEpoch
            .toDouble(),
        lineBarsData: [
          LineChartBarData(
            spots: state.bodyWeightData
                .map((data) => FlSpot(
                    data.date.millisecondsSinceEpoch.toDouble(), data.weight))
                .toList(),
            color: Colors.transparent,
          ),
        ],
      ),
    );
  }
}

class _BodyFatPercentageSlideTitles extends StatelessWidget {
  const _BodyFatPercentageSlideTitles({
    required this.state,
  });

  final CanSlideChartState state;

  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
        titlesData: FlTitlesData(
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
          rightTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 40,
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
          leftTitles: const AxisTitles(
            sideTitles: SideTitles(
              showTitles: false,
            ),
          ),
        ),
        borderData: FlBorderData(show: false),
        maxY: ((state.latestBodyFatPercentage + 20) / 5).ceil() * 5,
        minY: ((state.latestBodyFatPercentage - 10) / 5).ceil() * 5,
      ),
    );
  }
}

class _AverageBodyWeightGraph extends StatelessWidget {
  const _AverageBodyWeightGraph({
    required this.state,
  });

  final CanSlideChartState state;

  @override
  Widget build(BuildContext context) {
    final themeScheme = Theme.of(context).colorScheme;
    return LineChart(
      LineChartData(
        titlesData: FlTitlesData(
          leftTitles: const AxisTitles(
            sideTitles: SideTitles(
              showTitles: false,
            ),
          ),
          rightTitles: const AxisTitles(
            sideTitles: SideTitles(
              showTitles: false,
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
        maxY: 80,
        minY: 65,
        baselineX: DateTime(
                DateTime.now().year, DateTime.now().month, DateTime.now().day)
            .subtract(Duration(days: state.rangeType.range))
            .millisecondsSinceEpoch
            .toDouble(),
        minX: DateTime(
                DateTime.now().year, DateTime.now().month, DateTime.now().day)
            .subtract(Duration(days: state.rangeType.range))
            .millisecondsSinceEpoch
            .toDouble(),
        maxX: DateTime(
                DateTime.now().year, DateTime.now().month, DateTime.now().day)
            .millisecondsSinceEpoch
            .toDouble(),
        gridData: const FlGridData(show: false),
        lineBarsData: [
          LineChartBarData(
            spots: state.averageBodyWeightData
                .map((data) => FlSpot(
                    data.date.millisecondsSinceEpoch.toDouble(), data.weight))
                .toList(),
            color: themeScheme.inversePrimary,
            isCurved: true,
            barWidth: 2,
            dotData: const FlDotData(show: false),
          ),
        ],
      ),
    );
  }
}

class _DailyBodyWeightGraph extends StatelessWidget {
  const _DailyBodyWeightGraph({
    required this.state,
  });

  final CanSlideChartState state;

  @override
  Widget build(BuildContext context) {
    final themeScheme = Theme.of(context).colorScheme;
    return LineChart(
      LineChartData(
        titlesData: FlTitlesData(
          leftTitles: const AxisTitles(
            sideTitles: SideTitles(
              showTitles: false,
            ),
          ),
          rightTitles: const AxisTitles(
            sideTitles: SideTitles(
              showTitles: false,
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
        maxY: 80,
        minY: 65,
        baselineX: DateTime(
                DateTime.now().year, DateTime.now().month, DateTime.now().day)
            .subtract(Duration(days: state.rangeType.range))
            .millisecondsSinceEpoch
            .toDouble(),
        minX: DateTime(
                DateTime.now().year, DateTime.now().month, DateTime.now().day)
            .subtract(Duration(days: state.rangeType.range))
            .millisecondsSinceEpoch
            .toDouble(),
        maxX: DateTime(
                DateTime.now().year, DateTime.now().month, DateTime.now().day)
            .millisecondsSinceEpoch
            .toDouble(),
        gridData: const FlGridData(show: false),
        lineBarsData: [
          LineChartBarData(
            spots: state.bodyWeightData
                .map((data) => FlSpot(
                    data.date.millisecondsSinceEpoch.toDouble(), data.weight))
                .toList(),
            color: Colors.transparent,
            isCurved: true,
            barWidth: 2,
            dotData: FlDotData(
              show: true,
              getDotPainter: (spot, percent, barData, index) {
                return FlDotCirclePainter(
                  radius: 4,
                  color: state.rangeType == DateRangeType.year
                      ? Colors.transparent
                      : themeScheme.inversePrimary,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _AverageBodyFatPercentageGraph extends StatelessWidget {
  const _AverageBodyFatPercentageGraph({
    required this.state,
  });

  final CanSlideChartState state;

  @override
  Widget build(BuildContext context) {
    final themeScheme = Theme.of(context).colorScheme;
    return LineChart(
      LineChartData(
        titlesData: FlTitlesData(
          leftTitles: const AxisTitles(
            sideTitles: SideTitles(
              showTitles: false,
            ),
          ),
          rightTitles: const AxisTitles(
            sideTitles: SideTitles(
              showTitles: false,
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
        maxY: 50,
        minY: 15,
        baselineX: DateTime(
                DateTime.now().year, DateTime.now().month, DateTime.now().day)
            .subtract(Duration(days: state.rangeType.range))
            .millisecondsSinceEpoch
            .toDouble(),
        minX: DateTime(
                DateTime.now().year, DateTime.now().month, DateTime.now().day)
            .subtract(Duration(days: state.rangeType.range))
            .millisecondsSinceEpoch
            .toDouble(),
        maxX: DateTime(
                DateTime.now().year, DateTime.now().month, DateTime.now().day)
            .millisecondsSinceEpoch
            .toDouble(),
        gridData: const FlGridData(show: false),
        lineBarsData: [
          LineChartBarData(
            spots: state.averageBodyFatPercentageData
                .map((data) => FlSpot(
                    data.date.millisecondsSinceEpoch.toDouble(),
                    data.bodyFatPercentage))
                .toList(),
            color: themeScheme.primaryContainer,
            isCurved: true,
            barWidth: 2,
            dotData: const FlDotData(show: false),
          ),
        ],
      ),
    );
  }
}

class _DailyBodyFatPercentageGraph extends StatelessWidget {
  const _DailyBodyFatPercentageGraph({
    required this.state,
  });

  final CanSlideChartState state;

  @override
  Widget build(BuildContext context) {
    final themeScheme = Theme.of(context).colorScheme;
    return LineChart(
      LineChartData(
        titlesData: FlTitlesData(
          leftTitles: const AxisTitles(
            sideTitles: SideTitles(
              showTitles: false,
            ),
          ),
          rightTitles: const AxisTitles(
            sideTitles: SideTitles(
              showTitles: false,
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
        maxY: 50,
        minY: 15,
        baselineX: DateTime(
                DateTime.now().year, DateTime.now().month, DateTime.now().day)
            .subtract(Duration(days: state.rangeType.range))
            .millisecondsSinceEpoch
            .toDouble(),
        minX: DateTime(
                DateTime.now().year, DateTime.now().month, DateTime.now().day)
            .subtract(Duration(days: state.rangeType.range))
            .millisecondsSinceEpoch
            .toDouble(),
        maxX: DateTime(
                DateTime.now().year, DateTime.now().month, DateTime.now().day)
            .millisecondsSinceEpoch
            .toDouble(),
        gridData: const FlGridData(show: false),
        lineTouchData: const LineTouchData(enabled: false),
        lineBarsData: [
          LineChartBarData(
            spots: state.bodyFatPercentageData
                .map((data) => FlSpot(
                    data.date.millisecondsSinceEpoch.toDouble(),
                    data.bodyFatPercentage))
                .toList(),
            color: Colors.transparent,
            isCurved: true,
            barWidth: 2,
            dotData: FlDotData(
              show: true,
              getDotPainter: (spot, percent, barData, index) {
                return FlDotCirclePainter(
                  radius: 4,
                  color: state.rangeType == DateRangeType.year
                      ? Colors.transparent
                      : themeScheme.primaryContainer,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
