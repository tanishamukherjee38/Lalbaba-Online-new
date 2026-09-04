// Authentication service.
// Why: Centralize authentication and local session operations.

import 'package:shared_preferences/shared_preferences.dart';

import '../constants/storage_keys.dart';

class AuthService {
  const AuthService();

  Future<String?> getToken() async {
    final preferences = await SharedPreferences.getInstance();

    return preferences.getString(StorageKeys.authToken);
  }

  Future<bool> hasToken() async {
    final token = await getToken();
    print('AuthService: hasToken() called. Token: $token');
    return token != null && token.trim().isNotEmpty;
  }

  Future<void> saveToken(String token) async {
    final preferences = await SharedPreferences.getInstance();

    await preferences.setString(StorageKeys.authToken, token);
  }

  Future<void> clearSession() async {
    final preferences = await SharedPreferences.getInstance();

    await preferences.remove(StorageKeys.authToken);
    await preferences.remove(StorageKeys.userId);
    await preferences.remove(StorageKeys.userData);
    await preferences.remove(StorageKeys.isLoggedIn);
  }
}
