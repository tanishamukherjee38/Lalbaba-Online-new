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
  static String get myOrders =>
      AppLanguageConstants.t('My Orders', 'আমার অর্ডার');

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
  static String get trendingThisWeek =>
      AppLanguageConstants.t('Trending this week', 'এই সপ্তাহের ট্রেন্ডিং');

  static String get bestSeller =>
      AppLanguageConstants.t('All time Best seller', 'সর্বকালের সেরা বিক্রিত');

  // ADDRESS
  // ============================================================
  // ADDRESS
  // ============================================================

  static String get address => AppLanguageConstants.t('Address', 'ঠিকানা');

  static String get addressType =>
      AppLanguageConstants.t('Address Type', 'ঠিকানার ধরন');

  static String get office => AppLanguageConstants.t('Office', 'অফিস');

  static String get other => AppLanguageConstants.t('Other', 'অন্যান্য');

  // ============================================================
  // CURRENT LOCATION
  // ============================================================

  static String get useCurrentLocation => AppLanguageConstants.t(
    'Use Current Location',
    'বর্তমান অবস্থান ব্যবহার করুন',
  );

  static String get useCurrentLocationSubtitle => AppLanguageConstants.t(
    'Automatically detect your address',
    'আপনার ঠিকানা স্বয়ংক্রিয়ভাবে শনাক্ত করুন',
  );

  static String get currentLocationDetected => AppLanguageConstants.t(
    'Current location detected',
    'বর্তমান অবস্থান শনাক্ত হয়েছে',
  );

  static String get unableToDetectLocation => AppLanguageConstants.t(
    'Unable to detect your location',
    'আপনার অবস্থান শনাক্ত করা যায়নি',
  );

  static String get locationPermissionDenied => AppLanguageConstants.t(
    'Location permission denied',
    'অবস্থান অনুমতি অস্বীকার করা হয়েছে',
  );

  static String get locationPermissionDeniedForever => AppLanguageConstants.t(
    'Location permission is permanently denied. Please enable it from Settings.',
    'অবস্থান অনুমতি স্থায়ীভাবে অস্বীকার করা হয়েছে। অনুগ্রহ করে সেটিংস থেকে এটি সক্রিয় করুন।',
  );

  static String get pleaseEnableLocation => AppLanguageConstants.t(
    'Please enable location services',
    'অনুগ্রহ করে লোকেশন সার্ভিস চালু করুন',
  );

  // ============================================================
  // CONTACT INFORMATION
  // ============================================================

  static String get contactInformation =>
      AppLanguageConstants.t('Contact Information', 'যোগাযোগের তথ্য');

  static String get fullName => AppLanguageConstants.t('Name', 'নাম');

  static String get phoneNumber =>
      AppLanguageConstants.t('Phone Number', 'ফোন নম্বর');

  static String get enterFullName =>
      AppLanguageConstants.t('Enter your name', 'আপনার নাম লিখুন');

  static String get enterPhoneNumber =>
      AppLanguageConstants.t('Enter phone number', 'ফোন নম্বর লিখুন');

  // ============================================================
  // LOCATION
  // ============================================================

  static String get location => AppLanguageConstants.t('Location', 'অবস্থান');

  static String get country => AppLanguageConstants.t('Country', 'দেশ');

  static String get state => AppLanguageConstants.t('State', 'রাজ্য');

  static String get city => AppLanguageConstants.t('City', 'শহর');

  static String get villageOrArea =>
      AppLanguageConstants.t('Village / Area', 'গ্রাম / এলাকা');

  static String get pinCode => AppLanguageConstants.t('PIN Code', 'পিন কোড');

  static String get selectCountry =>
      AppLanguageConstants.t('Select your country', 'আপনার দেশ নির্বাচন করুন');

  static String get selectState =>
      AppLanguageConstants.t('Select state', 'রাজ্য নির্বাচন করুন');

  static String get selectCity =>
      AppLanguageConstants.t('Select city', 'শহর নির্বাচন করুন');

  static String get selectVillageOrArea => AppLanguageConstants.t(
    'Select village / area',
    'গ্রাম / এলাকা নির্বাচন করুন',
  );

  static String get selectCountryFirst => AppLanguageConstants.t(
    'Select country first',
    'প্রথমে দেশ নির্বাচন করুন',
  );

  static String get selectStateFirst => AppLanguageConstants.t(
    'Select state first',
    'প্রথমে রাজ্য নির্বাচন করুন',
  );

  static String get selectCityFirst =>
      AppLanguageConstants.t('Select city first', 'প্রথমে শহর নির্বাচন করুন');

  static String get enterPinCode =>
      AppLanguageConstants.t('Enter PIN code', 'পিন কোড লিখুন');

  // ============================================================
  // DELIVERY ADDRESS
  // ============================================================

  static String get deliveryAddress =>
      AppLanguageConstants.t('Delivery Address', 'ডেলিভারি ঠিকানা');

  static String get enterAddress => AppLanguageConstants.t(
    'House / Flat / Street Address',
    'বাড়ি / ফ্ল্যাট / রাস্তার ঠিকানা',
  );

  static String get deliveryAddressSubtitle => AppLanguageConstants.t(
    'Enter your house, flat, building or street details.',
    'বাড়ি, ফ্ল্যাট, বিল্ডিং বা রাস্তার বিস্তারিত ঠিকানা লিখুন।',
  );

  static String get nearbyLandmark =>
      AppLanguageConstants.t('Nearby Landmark', 'নিকটবর্তী ল্যান্ডমার্ক');

  static String get nearbyLandmarkHint => AppLanguageConstants.t(
    'Nearby landmark (optional)',
    'নিকটবর্তী ল্যান্ডমার্ক (ঐচ্ছিক)',
  );

  // ============================================================
  // ACTION
  // ============================================================

  static String get saveAddress =>
      AppLanguageConstants.t('Save Address', 'ঠিকানা সংরক্ষণ করুন');
}
