/// Supported app languages.
enum AppLanguage { english, bengali }

extension AppLanguageX on AppLanguage {
  /// Display name of the language, e.g. shown as a trailing label.
  String get label => this == AppLanguage.english ? 'English' : 'বাংলা';
}

/// Single constants "page" for the whole app's language.
/// NO controller, NO state-management package — just plain static
/// values that any other page can read directly and pull the current
/// language / text from.
///
/// Usage in any page:
/// ```dart
/// import 'language_constants.dart';
///
/// Text(AppLanguageConstants.t('Orders', 'অর্ডার'))
/// ```
///
/// To change the language (done from LanguageSelectionPage):
/// ```dart
/// AppLanguageConstants.current = AppLanguage.bengali;
/// ```
/// Since this is a plain static value (not listenable), whichever page
/// needs to reflect the new language should call `setState(() {})`
/// (or similar) after coming back from the language page — see
/// account_page.dart for an example.
class AppLanguageConstants {
  AppLanguageConstants._();

  /// Current language for the whole app.
  static AppLanguage current = AppLanguage.english;

  /// Pick text based on the current language.
  /// Usage: AppLanguageConstants.t('Orders', 'অর্ডার')
  static String t(String en, String bn) =>
      current == AppLanguage.english ? en : bn;
}
