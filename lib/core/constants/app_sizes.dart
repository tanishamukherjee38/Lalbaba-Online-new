import 'package:flutter_screenutil/flutter_screenutil.dart';

/// use  AppSizes for consistent responsive sizing
/*
   screenPadding_16: AppSizes.screenPadding_16,
   spacingSmall_8: AppSizes.spacingSmall_8,
*/
class AppSizes {
  AppSizes._();

  // ============================================================
  // PRIVATE RESPONSIVE SIZE HELPERS
  // ============================================================

  /// Responsive width
  /// Use for horizontal spacing, padding and width.
  static double _width(double value) {
    return value.w;
  }

  /// Responsive height
  /// Use for vertical spacing and widget height.
  static double _height(double value) {
    return value.h;
  }

  /// Responsive square size / radius
  /// Use for icon size, image size, avatar size and border radius.
  static double _size(double value) {
    return value.r;
  }

  // ============================================================
  // SCREEN PADDING
  // ============================================================

  static double screenPadding_16 = _width(16);
  static double screenPaddingSmall_12 = _width(12);
  static double screenPaddingLarge_20 = _width(20);

  // ============================================================
  // SPACING
  // ============================================================

  static double spacingXSmall_4 = _width(4);
  static double spacingSmall_8 = _width(8);
  static double spacingMedium_12 = _width(12);
  static double spacingLarge_16 = _width(16);
  static double spacingXLarge_20 = _width(20);
  static double spacingXXLarge_24 = _width(24);
  static double spacingSection_32 = _width(32);

  // ============================================================
  // HEIGHT
  // ============================================================

  static double appBarHeight_56 = _height(56);

  static double buttonHeight_48 = _height(48);
  static double buttonHeightSmall_40 = _height(40);

  static double inputHeight_50 = _height(50);
  static double searchHeight_48 = _height(48);

  // ============================================================
  // ICON SIZE
  // ============================================================

  static double iconSmall_18 = _size(18);
  static double iconMedium_24 = _size(24);
  static double iconLarge_28 = _size(28);
  static double iconXLarge_32 = _size(32);

  // ============================================================
  // BORDER RADIUS
  // ============================================================

  static double radiusSmall_6 = _size(6);
  static double radiusMedium_10 = _size(10);
  static double radiusLarge_12 = _size(12);
  static double radiusXLarge_16 = _size(16);
  static double radiusXXLarge_20 = _size(20);

  // ============================================================
  // PRODUCT
  // ============================================================

  static double productImageSize_64 = _size(64);
  static double productCardImageSize_120 = _size(120);

  // ============================================================
  // CATEGORY
  // ============================================================

  static double categoryImageSize_64 = _size(64);

  // ============================================================
  // CARD
  // ============================================================

  static double cardPadding_12 = _width(12);
  static double cardPaddingLarge_16 = _width(16);

  // ============================================================
  // AVATAR
  // ============================================================

  static double avatarSmall_32 = _size(32);
  static double avatarMedium_44 = _size(44);
  static double avatarLarge_64 = _size(64);

  // ============================================================
  // BOTTOM NAVIGATION
  // ============================================================

  static double bottomNavHeight_64 = _height(64);

  // ============================================================
  // FAB
  // ============================================================

  static double fabSize_56 = _size(56);

  // ============================================================
  // DIALOG
  // ============================================================

  static double dialogPadding_20 = _width(20);
  static double dialogRadius_16 = _size(16);

  // ============================================================
  // BOTTOM SHEET
  // ============================================================

  static double bottomSheetRadius_20 = _size(20);

  // ============================================================
  // DIVIDER
  // ============================================================

  static double dividerHeight_1 = _height(1);
}
