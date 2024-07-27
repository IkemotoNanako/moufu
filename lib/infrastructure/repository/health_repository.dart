import 'package:health/health.dart';

class HealthRepository {
  HealthRepository();

  final Health _health = Health();

  Future<bool> requestHealthPermissions() async {
    return await _health.requestAuthorization(
      [HealthDataType.WEIGHT, HealthDataType.BODY_FAT_PERCENTAGE],
      permissions: [
        HealthDataAccess.READ_WRITE,
        HealthDataAccess.READ_WRITE,
      ],
    );
  }

  Future<List<HealthDataPoint>> getHealthDataPoints(HealthDataType type) async {
    final types = [type];
    final now = DateTime.now();
    final startDate = now.subtract(const Duration(days: 700));
    final endDate = now;
    try {
      return await _health.getHealthDataFromTypes(
          types: types, startTime: startDate, endTime: endDate);
    } catch (e) {
      return [];
    }
  }

  Future<void> saveHealthDataPoint(
      double value, HealthDataType type, DateTime date) async {
    await _health.writeHealthData(
        value: value, type: type, startTime: date, endTime: date);
  }
}