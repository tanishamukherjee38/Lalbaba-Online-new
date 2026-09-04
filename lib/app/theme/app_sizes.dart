import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppSizes {
  AppSizes._();

  // ============================================================
  // HELPER
  // ============================================================

  static double _w(double value, {double? min, double? max}) {
    final scaled = value.w;

    if (min != null && scaled < min) {
      return min;
    }

    if (max != null && scaled > max) {
      return max;
    }

    return scaled;
  }

  static double _h(double value, {double? min, double? max}) {
    final scaled = value.h;

    if (min != null && scaled < min) {
      return min;
    }

    if (max != null && scaled > max) {
      return max;
    }

    return scaled;
  }

  static double _r(double value, {double? min, double? max}) {
    final scaled = value.r;

    if (min != null && scaled < min) {
      return min;
    }

    if (max != null && scaled > max) {
      return max;
    }

    return scaled;
  }

  // ============================================================
  // SCREEN PADDING
  // ============================================================

  static double screenPadding = _w(16, min: 12, max: 20);

  static double screenPaddingSmall = _w(12, min: 10, max: 16);

  static double screenPaddingLarge = _w(20, min: 16, max: 24);

  // ============================================================
  // SPACING
  // ============================================================

  static double spacingXXSmall = _w(4, min: 4, max: 6);

  static double spacingSmall = _w(8, min: 6, max: 10);

  static double spacingMedium = _w(12, min: 10, max: 14);

  static double spacingLarge = _w(16, min: 14, max: 18);

  static double spacingXLarge = _w(20, min: 16, max: 22);

  static double spacingXXLarge = _w(24, min: 20, max: 28);

  static double spacingSection = _w(32, min: 28, max: 36);

  // ============================================================
  // APP BAR
  // ============================================================

  static double appBarHeight = _h(56, min: 52, max: 64);

  static double appBarIconSize = _r(24, min: 22, max: 28);

  // ============================================================
  // BUTTON
  // ============================================================

  static double buttonHeight = _h(48, min: 44, max: 52);

  static double buttonHeightSmall = _h(40, min: 36, max: 44);

  static double buttonHorizontalPadding = _w(16, min: 12, max: 20);

  // ============================================================
  // INPUT / SEARCH
  // ============================================================

  static double inputHeight = _h(50, min: 46, max: 54);

  static double searchHeight = _h(48, min: 44, max: 52);

  // ============================================================
  // ICON
  // ============================================================

  static double iconSmall = _r(18, min: 16, max: 20);

  static double iconMedium = _r(24, min: 20, max: 26);

  static double iconLarge = _r(28, min: 24, max: 32);

  static double iconXLarge = _r(32, min: 28, max: 36);

  // ============================================================
  // RADIUS
  // ============================================================

  static double radiusSmall = _r(6, min: 4, max: 8);

  static double radiusMedium = _r(10, min: 8, max: 12);

  static double radiusLarge = _r(12, min: 10, max: 16);

  static double radiusXLarge = _r(16, min: 12, max: 20);

  // ============================================================
  // PRODUCT
  // ============================================================

  static double productImageWidth = _w(60, min: 52, max: 72);

  static double productImageHeight = _h(70, min: 60, max: 80);

  static double productItemHeight = _h(80, min: 72, max: 90);

  // ============================================================
  // CATEGORY
  // ============================================================

  static double categoryImageSize = _r(64, min: 52, max: 76);

  // ============================================================
  // CARD
  // ============================================================

  static double cardPadding = _w(12, min: 10, max: 16);

  static double cardRadius = _r(12, min: 10, max: 16);

  // ============================================================
  // AVATAR
  // ============================================================

  static double avatarSmall = _r(32, min: 28, max: 36);

  static double avatarMedium = _r(44, min: 40, max: 48);

  static double avatarLarge = _r(64, min: 56, max: 72);

  // ============================================================
  // BOTTOM NAVIGATION
  // ============================================================

  static double bottomNavHeight = _h(64, min: 56, max: 72);

  // ============================================================
  // FAB
  // ============================================================

  static double fabSize = _r(56, min: 48, max: 60);

  // ============================================================
  // DIVIDER
  // ============================================================

  static double dividerHeight = 1;

  // ============================================================
  // DIALOG
  // ============================================================

  static double dialogHorizontalPadding = _w(20, min: 16, max: 24);

  static double dialogRadius = _r(16, min: 12, max: 20);
}
