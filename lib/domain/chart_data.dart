class BodyWeightData {
  final DateTime date;
  final double weight;

  BodyWeightData({required this.date, required this.weight});
}

class BodyFatPercentageData {
  final DateTime date;
  final double bodyFatPercentage;

  BodyFatPercentageData({required this.date, required this.bodyFatPercentage});
}

enum DateRangeType {
  week,
  month,
  threeMonths,
  year;

  get range {
    switch (this) {
      case DateRangeType.week:
        return 7;
      case DateRangeType.month:
        return 30;
      case DateRangeType.threeMonths:
        return 90;
      case DateRangeType.year:
        return 365;
    }
  }

  get interval {
    switch (this) {
      case DateRangeType.week:
        return 1;
      case DateRangeType.month:
        return 4;
      case DateRangeType.threeMonths:
        return 10;
      case DateRangeType.year:
        return 30;
    }
  }
}
