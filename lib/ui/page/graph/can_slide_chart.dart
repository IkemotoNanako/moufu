import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:moufu/domain/chart_model.dart';
import 'package:moufu/ui/controller/graph/can_slide_chart_controller.dart';
import 'package:moufu/ui/state/can_slide_chart_state.dart';
import 'package:permission_handler/permission_handler.dart';

class CanSlideChart extends ConsumerStatefulWidget {
  const CanSlideChart({super.key});

  @override
  CanSlideChartWidgetState createState() => CanSlideChartWidgetState();
}

class CanSlideChartWidgetState extends ConsumerState<CanSlideChart>
    with WidgetsBindingObserver {
  late WidgetRef _ref;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);

    if (state == AppLifecycleState.resumed) {
      _ref.read(canSlideChartControllerProvider.notifier).updateData();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, watch, child) {
      _ref = watch; // refを保存
      final state = ref.watch(canSlideChartControllerProvider);
      final notifier = ref.watch(canSlideChartControllerProvider.notifier);
      final themeScheme = Theme.of(context).colorScheme;
      return state.when(
        data: (data) {
          if (data.bodyWeightData.isNotEmpty) {
            return Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _RangeSelectButton(
                      text: '1ヶ月',
                      onPressed: () {
                        notifier.changeRangeType(DateRangeType.month);
                      },
                      active: data.rangeType == DateRangeType.month,
                    ),
                    _RangeSelectButton(
                      text: '3ヶ月',
                      onPressed: () {
                        notifier.changeRangeType(DateRangeType.threeMonths);
                      },
                      active: data.rangeType == DateRangeType.threeMonths,
                    ),
                    _RangeSelectButton(
                      text: '6ヶ月',
                      onPressed: () {
                        notifier.changeRangeType(DateRangeType.year);
                      },
                      active: data.rangeType == DateRangeType.year,
                    ),
                    _RangeSelectButton(
                      text: '2年',
                      onPressed: () {
                        notifier.changeRangeType(DateRangeType.twoYears);
                      },
                      active: data.rangeType == DateRangeType.twoYears,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: themeScheme.inversePrimary,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 4),
                          child: Text(
                            '体重',
                            style: TextStyle(
                              color: themeScheme.onPrimary,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: themeScheme.tertiaryContainer,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 4),
                          child: Text(
                            '体脂肪率',
                            style: TextStyle(
                              color: themeScheme.onPrimary,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox.fromSize(
                  size: const Size.fromHeight(8),
                ),
                Expanded(
                  child: Stack(
                    children: [
                      _BodyWeightSideTitles(state: data),
                      _BodyFatPercentageSlideTitles(state: data),
                      SingleChildScrollView(
                        reverse: true,
                        scrollDirection: Axis.horizontal,
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 2,
                          child: Stack(
                            children: [
                              _DateSlideTitles(state: data),
                              _AverageBodyWeightGraph(state: data),
                              _DailyBodyWeightGraph(state: data),
                              _AverageBodyFatPercentageGraph(state: data),
                              _DailyBodyFatPercentageGraph(state: data)
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          } else {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('データがありません', style: TextStyle(fontSize: 20)),
                  SizedBox.fromSize(size: const Size.fromHeight(16)),
                  const Text('* ヘルスケアと連携していない場合',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  SizedBox.fromSize(size: const Size.fromHeight(4)),
                  const Text('下のボタンから設定アプリに移動'),
                  const Text('プライバシーとセキュリティ→ヘルスケア→モーフ'),
                  const Text('の順に移動して、全てをオンにしてください'),
                  SizedBox.fromSize(size: const Size.fromHeight(4)),
                  ElevatedButton(
                    onPressed: () {
                      openAppSettings();
                    },
                    child: const Text('設定アプリへ移動'),
                  ),
                  SizedBox.fromSize(size: const Size.fromHeight(16)),
                  const Text('* ヘルスケアと連携している場合',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  SizedBox.fromSize(size: const Size.fromHeight(4)),
                  const Text('下の＋ボタンから体重・体脂肪率を追加してください'),
                ],
              ),
            );
          }
        },
        error: (_, __) => Center(
          child: TextButton(
            onPressed: notifier.build,
            child: const Text('リトライ'),
          ),
        ),
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
      );
    });
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
        ),
        borderData: FlBorderData(show: false),
        maxY: ((state.latestWeight + 10) / 5).ceil() * 5,
        minY: ((state.latestWeight - 15) / 5).ceil() * 5,
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
            .add(const Duration(days: 1))
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
          leftTitles: const AxisTitles(
            sideTitles: SideTitles(
              showTitles: false,
            ),
          ),
        ),
        borderData: FlBorderData(show: false),
        maxY: ((state.latestBodyFatPercentage + 7) / 2).ceil() * 2,
        minY: ((state.latestBodyFatPercentage - 3) / 2).ceil() * 2,
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
    var sortableData = List.from(state.averageBodyWeightData);
    sortableData.sort((a, b) => a.date.compareTo(b.date));
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
        maxY: ((state.latestWeight + 10) / 5).ceil() * 5,
        minY: ((state.latestWeight - 15) / 5).ceil() * 5,
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
            .add(const Duration(days: 1))
            .millisecondsSinceEpoch
            .toDouble(),
        gridData: const FlGridData(show: false),
        lineBarsData: [
          LineChartBarData(
            spots: sortableData
                .map(
                  (data) => FlSpot(
                      data.date.millisecondsSinceEpoch.toDouble(), data.weight),
                )
                .toList(),
            color: themeScheme.inversePrimary,
            isCurved: false,
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
        maxY: ((state.latestWeight + 10) / 5).ceil() * 5,
        minY: ((state.latestWeight - 15) / 5).ceil() * 5,
        baselineX: DateTime(
                DateTime.now().year, DateTime.now().month, DateTime.now().day)
            .subtract(Duration(days: state.rangeType.range))
            .millisecondsSinceEpoch
            .toDouble(),
        minX: DateTime(
                DateTime.now().year, DateTime.now().month, DateTime.now().day)
            .subtract(
              Duration(days: state.rangeType.range),
            )
            .millisecondsSinceEpoch
            .toDouble(),
        maxX: DateTime(
                DateTime.now().year, DateTime.now().month, DateTime.now().day)
            .add(
              const Duration(days: 1),
            )
            .millisecondsSinceEpoch
            .toDouble(),
        gridData: const FlGridData(show: false),
        lineBarsData: [
          LineChartBarData(
            spots: state.bodyWeightData
                .map(
                  (data) => FlSpot(
                      data.date.millisecondsSinceEpoch.toDouble(), data.weight),
                )
                .toList(),
            color: Colors.transparent,
            isCurved: false,
            barWidth: 2,
            dotData: FlDotData(
              show: true,
              getDotPainter: (spot, percent, barData, index) {
                return FlDotCirclePainter(
                  radius: 4,
                  color: state.rangeType == DateRangeType.year ||
                          state.rangeType == DateRangeType.twoYears
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
    var sortableData = List.from(state.averageBodyFatPercentageData);
    sortableData.sort((a, b) => a.date.compareTo(b.date));
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
        maxY: ((state.latestBodyFatPercentage + 7) / 2).ceil() * 2,
        minY: ((state.latestBodyFatPercentage - 3) / 2).ceil() * 2,
        baselineX: DateTime(
                DateTime.now().year, DateTime.now().month, DateTime.now().day)
            .subtract(
              Duration(days: state.rangeType.range),
            )
            .millisecondsSinceEpoch
            .toDouble(),
        minX: DateTime(
                DateTime.now().year, DateTime.now().month, DateTime.now().day)
            .subtract(
              Duration(days: state.rangeType.range),
            )
            .millisecondsSinceEpoch
            .toDouble(),
        maxX: DateTime(
                DateTime.now().year, DateTime.now().month, DateTime.now().day)
            .add(const Duration(days: 1))
            .millisecondsSinceEpoch
            .toDouble(),
        gridData: const FlGridData(show: false),
        lineBarsData: [
          LineChartBarData(
            spots: sortableData
                .map(
                  (data) => FlSpot(data.date.millisecondsSinceEpoch.toDouble(),
                      data.bodyFatPercentage),
                )
                .toList(),
            color: themeScheme.tertiaryContainer,
            isCurved: false,
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
        maxY: ((state.latestBodyFatPercentage + 7) / 2).ceil() * 2,
        minY: ((state.latestBodyFatPercentage - 3) / 2).ceil() * 2,
        baselineX: DateTime(
                DateTime.now().year, DateTime.now().month, DateTime.now().day)
            .subtract(
              Duration(days: state.rangeType.range),
            )
            .millisecondsSinceEpoch
            .toDouble(),
        minX: DateTime(
                DateTime.now().year, DateTime.now().month, DateTime.now().day)
            .subtract(
              Duration(days: state.rangeType.range),
            )
            .millisecondsSinceEpoch
            .toDouble(),
        maxX: DateTime(
                DateTime.now().year, DateTime.now().month, DateTime.now().day)
            .add(
              const Duration(days: 1),
            )
            .millisecondsSinceEpoch
            .toDouble(),
        gridData: const FlGridData(show: false),
        lineTouchData: const LineTouchData(enabled: false),
        lineBarsData: [
          LineChartBarData(
            spots: state.bodyFatPercentageData
                .map(
                  (data) => FlSpot(data.date.millisecondsSinceEpoch.toDouble(),
                      data.bodyFatPercentage),
                )
                .toList(),
            color: Colors.transparent,
            isCurved: true,
            barWidth: 2,
            dotData: FlDotData(
              show: true,
              getDotPainter: (spot, percent, barData, index) {
                return FlDotCirclePainter(
                  radius: 4,
                  color: state.rangeType == DateRangeType.year ||
                          state.rangeType == DateRangeType.twoYears
                      ? Colors.transparent
                      : themeScheme.tertiaryContainer,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
