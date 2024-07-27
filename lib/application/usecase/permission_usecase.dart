import 'package:moufu/infrastructure/repository/health_repository.dart';

class PermissionUsecase {
  final HealthRepository _healthRepository;

  PermissionUsecase(this._healthRepository);

  Future<void> checkAndRequestPermissions() async {
    print('Checking and requesting permissions');
    await _healthRepository.requestHealthPermissions();
    print('Permissions requested');
  }
}
