class BodyWeightDataModel {
  final DateTime date;
  final double weight;

  BodyWeightDataModel({required this.date, required this.weight});
}

class BodyFatPercentageDataModel {
  final DateTime date;
  final double bodyFatPercentage;

  BodyFatPercentageDataModel(
      {required this.date, required this.bodyFatPercentage});
}

enum DateRangeType {
  week,
  month,
  threeMonths,
  year;

  get range {
    switch (this) {
      case DateRangeType.week:
        return 7 * 2 - 1;
      case DateRangeType.month:
        return 30 * 2 - 1;
      case DateRangeType.threeMonths:
        return 90 * 2 - 1;
      case DateRangeType.year:
        return 360 - 1;
    }
  }

  get interval {
    switch (this) {
      case DateRangeType.week:
        return 1;
      case DateRangeType.month:
        return 6;
      case DateRangeType.threeMonths:
        return 20;
      case DateRangeType.year:
        return 30;
    }
  }
}
