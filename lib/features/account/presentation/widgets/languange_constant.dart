import 'package:flutter/foundation.dart';

enum AppLanguage { english, bengali }

class AppLanguageConstants extends ChangeNotifier {
  AppLanguageConstants._();

  static final instance = AppLanguageConstants._();

  static AppLanguage _current = AppLanguage.english;

  static AppLanguage get current => _current;

  static void change(AppLanguage language) {
    if (_current == language) return;

    _current = language;
    instance.notifyListeners();
  }

  static String t(String en, String bn) =>
      _current == AppLanguage.english ? en : bn;
}
