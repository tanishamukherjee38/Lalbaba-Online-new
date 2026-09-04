import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_colors.dart';

/// use  AppTextStyles for consistent theming
/*
   fontSize: AppTextStyles.headingMedium.fontSize,
   fontWeight: AppTextStyles.headingMedium.fontWeight,
   color: AppTextStyles.headingMedium.color,
*/
class AppTextStyles {
  AppTextStyles._();

  // ============================================================
  // FONT SIZE HELPER
  // ============================================================

  static double _sp(double value, {double? min, double? max}) {
    final scaled = value.sp;

    if (min != null && scaled < min) {
      return min;
    }

    if (max != null && scaled > max) {
      return max;
    }

    return scaled;
  }

  // ============================================================
  // DISPLAY
  // ============================================================

  static TextStyle displayLarge = TextStyle(
    fontSize: _sp(32, min: 28, max: 36),
    fontWeight: FontWeight.w700,
    color: AppColors.textPrimary,
  );

  static TextStyle displayMedium = TextStyle(
    fontSize: _sp(28, min: 24, max: 32),
    fontWeight: FontWeight.w700,
    color: AppColors.textPrimary,
  );

  // ============================================================
  // HEADING
  // ============================================================

  static TextStyle headingLarge = TextStyle(
    fontSize: _sp(22, min: 20, max: 24),
    fontWeight: FontWeight.w700,
    color: AppColors.textPrimary,
  );

  static TextStyle headingMedium = TextStyle(
    fontSize: _sp(18, min: 16, max: 20),
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
  );

  static TextStyle headingSmall = TextStyle(
    fontSize: _sp(16, min: 14, max: 18),
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
  );

  // ============================================================
  // BODY
  // ============================================================

  static TextStyle bodyLarge = TextStyle(
    fontSize: _sp(16, min: 14, max: 18),
    fontWeight: FontWeight.w400,
    color: AppColors.textPrimary,
  );

  static TextStyle bodyMedium = TextStyle(
    fontSize: _sp(14, min: 13, max: 16),
    fontWeight: FontWeight.w400,
    color: AppColors.textPrimary,
  );

  static TextStyle bodySmall = TextStyle(
    fontSize: _sp(12, min: 11, max: 14),
    fontWeight: FontWeight.w400,
    color: AppColors.textSecondary,
  );

  // ============================================================
  // PRODUCT
  // ============================================================

  static TextStyle productName = TextStyle(
    fontSize: _sp(13, min: 12, max: 15),
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
  );

  static TextStyle productPrice = TextStyle(
    fontSize: _sp(13, min: 12, max: 15),
    fontWeight: FontWeight.w700,
    color: AppColors.textPrimary,
  );

  // ============================================================
  // BUTTON
  // ============================================================

  static TextStyle button = TextStyle(
    fontSize: _sp(14, min: 13, max: 16),
    fontWeight: FontWeight.w600,
    color: AppColors.white,
  );

  // ============================================================
  // LABEL
  // ============================================================

  static TextStyle label = TextStyle(
    fontSize: _sp(12, min: 11, max: 14),
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
  );

  // ============================================================
  // SEARCH
  // ============================================================

  static TextStyle searchText = TextStyle(
    fontSize: _sp(14, min: 13, max: 16),
    fontWeight: FontWeight.w400,
    color: AppColors.textPrimary,
  );

  static TextStyle searchHint = TextStyle(
    fontSize: _sp(14, min: 13, max: 16),
    fontWeight: FontWeight.w400,
    color: AppColors.textSecondary,
  );

  // ============================================================
  // SECTION TITLE
  // ============================================================

  static TextStyle sectionTitle = TextStyle(
    fontSize: _sp(13, min: 12, max: 15),
    fontWeight: FontWeight.w700,
    color: AppColors.textSecondary,
  );

  // ============================================================
  // ERROR
  // ============================================================

  static TextStyle error = TextStyle(
    fontSize: _sp(13, min: 12, max: 15),
    fontWeight: FontWeight.w500,
    color: AppColors.error,
  );
}
