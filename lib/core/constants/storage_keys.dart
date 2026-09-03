// Local storage key constants.
// Why: Keep keys for tokens, user data, preferences, and other stored values consistent.

// Local storage keys.
// Why: Keep all SharedPreferences/local-storage keys centralized.

class StorageKeys {
  StorageKeys._();

  static const String authToken = 'auth_token';
  static const String userId = 'user_id';
  static const String userData = 'user_data';
  static const String isLoggedIn = 'is_logged_in';
}
