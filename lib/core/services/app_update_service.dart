// Application update service.
// Why: Keep application version/update checking separate from UI.

import 'package:package_info_plus/package_info_plus.dart';
import 'package:upgrader/upgrader.dart';

class AppUpdateService {
  const AppUpdateService();

  /// Returns the currently installed application version.
  Future<String> getCurrentVersion() async {
    final packageInfo = await PackageInfo.fromPlatform();

    return packageInfo.version;
  }

  /// Checks whether an update is available.
  ///
  /// Returns true when a newer version is available from the store.
  Future<bool> isUpdateAvailable() async {
    try {
      final upgrader = Upgrader();

      await upgrader.initialize();

      return upgrader.isUpdateAvailable();
    } catch (_) {
      // Update checking should never block application startup.
      return false;
    }
  }
}
