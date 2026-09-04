// import 'languange_constant.dart';

// /// All app text lives HERE — one place. Main pages don't write
// /// English/Bengali pairs at all, they just use a name like
// /// `AppStrings.wishlist`, and it automatically shows in whichever
// /// language is set in [AppLanguageConstants.current].
// ///
// /// To add a new label: add one line here, then use `AppStrings.xxx`
// /// anywhere in the app.
// ///
// class AppStrings {
//   AppStrings._();

//   static String get language => AppLanguageConstants.t('Language', 'ভাষা');
//   static String get appVersion =>
//       AppLanguageConstants.t('App Version', 'অ্যাপ সংস্করণ');
//   static String get home => AppLanguageConstants.t('Home', 'হোম');

//   static String get categories =>
//       AppLanguageConstants.t('Categories', 'ক্যাটাগরি');

//   static String get cart => AppLanguageConstants.t('Cart', 'কার্ট');

//   static String get notifications =>
//       AppLanguageConstants.t('Notifications', 'নোটিফিকেশন');

//   static String get account => AppLanguageConstants.t('Account', 'অ্যাকাউন্ট');

//   static String get aboutUs =>
//       AppLanguageConstants.t('About Us', 'আমাদের সম্পর্কে');

//   static String get supportPolicy =>
//       AppLanguageConstants.t('Support Policy', 'সাপোর্ট পলিসি');

//   static String get termsOfUse =>
//       AppLanguageConstants.t('Terms of Use', 'ব্যবহারের শর্তাবলী');

//   static String get trackOrders =>
//       AppLanguageConstants.t('Track Orders', 'অর্ডার ট্র্যাক করুন');

//   static String get wishlist => AppLanguageConstants.t('Wishlist', 'উইশলিস্ট');

//   static String get shippingPolicy =>
//       AppLanguageConstants.t('Shipping Policy', 'শিপিং পলিসি');

//   static String get returnsAndRefund =>
//       AppLanguageConstants.t('Returns and Refund', 'রিটার্ন ও রিফান্ড');

//   static String get privacyPolicy =>
//       AppLanguageConstants.t('Privacy Policy', 'প্রাইভেসি পলিসি');

//   static String get factoryLocator =>
//       AppLanguageConstants.t('Factory Locator', 'ফ্যাক্টরি লোকেটর');

//   static String get logOut => AppLanguageConstants.t('Log Out', 'লগ আউট');

//   static String get selectLanguage =>
//       AppLanguageConstants.t('Select Language', 'ভাষা নির্বাচন করুন');

//   static String get selectLanguageSubtitle => AppLanguageConstants.t(
//     'Choose the language you want to use in the app.',
//     'অ্যাপে আপনি যে ভাষা ব্যবহার করতে চান তা বেছে নিন।',
//   );
// }

import 'languange_constant.dart';

/// All app text lives HERE — one place. Main pages don't write
/// English/Bengali pairs at all, they just use a name like
/// `AppStrings.wishlist`, and it automatically shows in whichever
/// language is set in [AppLanguageConstants.current].
///
/// To add a new label: add one line here, then use `AppStrings.xxx`
/// anywhere in the app.
///
class AppStrings {
  AppStrings._();

  static String get language => AppLanguageConstants.t('Language', 'ভাষা');
  static String get appVersion =>
      AppLanguageConstants.t('App Version', 'অ্যাপ সংস্করণ');
  static String get home => AppLanguageConstants.t('Home', 'হোম');

  static String get categories =>
      AppLanguageConstants.t('Categories', 'ক্যাটাগরি');

  static String get cart => AppLanguageConstants.t('Cart', 'কার্ট');

  static String get notifications =>
      AppLanguageConstants.t('Notifications', 'নোটিফিকেশন');

  static String get account => AppLanguageConstants.t('Account', 'অ্যাকাউন্ট');

  static String get aboutUs =>
      AppLanguageConstants.t('About Us', 'আমাদের সম্পর্কে');

  static String get supportPolicy =>
      AppLanguageConstants.t('Support Policy', 'সাপোর্ট পলিসি');

  static String get termsOfUse =>
      AppLanguageConstants.t('Terms of Use', 'ব্যবহারের শর্তাবলী');

  static String get trackOrders =>
      AppLanguageConstants.t('My Orders', 'অর্ডার ট্র্যাক করুন');

  static String get wishlist => AppLanguageConstants.t('Wishlist', 'উইশলিস্ট');

  static String get shippingPolicy =>
      AppLanguageConstants.t('Shipping Policy', 'শিপিং পলিসি');

  static String get returnsAndRefund =>
      AppLanguageConstants.t('Returns and Refund', 'রিটার্ন ও রিফান্ড');

  static String get privacyPolicy =>
      AppLanguageConstants.t('Privacy Policy', 'প্রাইভেসি পলিসি');

  static String get factoryLocator =>
      AppLanguageConstants.t('Factory Locator', 'ফ্যাক্টরি লোকেটর');

  static String get logOut => AppLanguageConstants.t('Log Out', 'লগ আউট');

  static String get selectLanguage =>
      AppLanguageConstants.t('Select Language', 'ভাষা নির্বাচন করুন');

  static String get selectLanguageSubtitle => AppLanguageConstants.t(
    'Choose the language you want to use in the app.',
    'অ্যাপে আপনি যে ভাষা ব্যবহার করতে চান তা বেছে নিন।',
  );

  // ─────────────────────────────────────────────
  // HOME PAGE — SECTION HEADINGS
  // ─────────────────────────────────────────────
  static String get trendingThisWeek => AppLanguageConstants.t(
        'Trending this week',
        'এই সপ্তাহের ট্রেন্ডিং',
      );

  static String get bestSeller => AppLanguageConstants.t(
        'All time Best seller',
        'সর্বকালের সেরা বিক্রিত',
      );
}
