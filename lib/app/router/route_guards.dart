import '../../core/services/auth_service.dart';

// Route guards.
// Why: Protect routes that require authentication.

class RouteGuards {
  RouteGuards._();

  static const AuthService _authService = AuthService();

  /// Returns true when the user has a valid stored auth token.
  static Future<bool> isAuthenticated() async {
    return _authService.hasToken();
  }
}
