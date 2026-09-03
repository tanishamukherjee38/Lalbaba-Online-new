// Network connectivity service.
// Why: Centralize all internet/network availability checks in one place.

import 'dart:async';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectivityService {
  ConnectivityService({Connectivity? connectivity})
    : _connectivity = connectivity ?? Connectivity();

  final Connectivity _connectivity;

  /// Checks whether the device has an active network connection
  /// and can actually reach the internet.
  Future<bool> hasInternetConnection() async {
    try {
      final connectivityResult = await _connectivity.checkConnectivity();

      final hasNetwork = connectivityResult.any(
        (result) => result != ConnectivityResult.none,
      );

      if (!hasNetwork) {
        return false;
      }

      // Network connection does not always mean internet access.
      // Verify actual internet connectivity.
      final result = await InternetAddress.lookup(
        'google.com',
      ).timeout(const Duration(seconds: 5));

      return result.isNotEmpty && result.first.rawAddress.isNotEmpty;
    } on SocketException {
      return false;
    } on TimeoutException {
      return false;
    } catch (_) {
      return false;
    }
  }

  /// Returns the current network type.
  Future<ConnectivityResult> getConnectionType() async {
    final results = await _connectivity.checkConnectivity();

    if (results.isEmpty) {
      return ConnectivityResult.none;
    }

    return results.first;
  }

  /// Listen for network changes.
  Stream<List<ConnectivityResult>> get connectivityStream {
    return _connectivity.onConnectivityChanged;
  }
}
