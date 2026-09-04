import 'package:flutter/material.dart';

import '../../app/theme/app_colors.dart';
import '../../app/theme/app_text_styles.dart';
import '../constants/app_sizes.dart';

/// Centralized UI feedback helper.
///
/// Why:
/// - Snackbar
/// - Success message
/// - Error message
/// - Warning message
/// - Info message
/// - Confirmation dialog
///
/// সব এক জায়গা থেকে manage করার জন্য এই helper ব্যবহার করা হবে.
/// Use this helper to show feedback messages to the user in a consistent way.
///
/*
FeedbackHelper.showSuccess(
  context,
  'Product added successfully',
);
======================
final result =
    await FeedbackHelper.showDeleteConfirmation(
  context,
);

if (result == true) {
  // Delete product
}

*/
class FeedbackHelper {
  FeedbackHelper._();

  // ============================================================
  // SUCCESS
  // ============================================================

  static void showSuccess(BuildContext context, String message) {
    _showSnackBar(
      context,
      message: message,
      backgroundColor: AppColors.success,
      icon: Icons.check_circle_outline,
    );
  }

  // ============================================================
  // ERROR
  // ============================================================

  static void showError(BuildContext context, String message) {
    _showSnackBar(
      context,
      message: message,
      backgroundColor: AppColors.error,
      icon: Icons.error_outline,
    );
  }

  // ============================================================
  // WARNING
  // ============================================================

  static void showWarning(BuildContext context, String message) {
    _showSnackBar(
      context,
      message: message,
      backgroundColor: AppColors.warning,
      icon: Icons.warning_amber_rounded,
    );
  }

  // ============================================================
  // INFO
  // ============================================================

  static void showInfo(BuildContext context, String message) {
    _showSnackBar(
      context,
      message: message,
      backgroundColor: AppColors.info,
      icon: Icons.info_outline,
    );
  }

  // ============================================================
  // COMMON SNACKBAR
  // ============================================================

  static void _showSnackBar(
    BuildContext context, {
    required String message,
    required Color backgroundColor,
    required IconData icon,
  }) {
    final messenger = ScaffoldMessenger.of(context);

    messenger
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Row(
            children: [
              Icon(icon, color: AppColors.white, size: AppSizes.iconMedium_24),

              SizedBox(width: AppSizes.spacingMedium_12),

              Expanded(
                child: Text(
                  message,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.bodyMedium.copyWith(
                    color: AppColors.white,
                  ),
                ),
              ),
            ],
          ),

          backgroundColor: backgroundColor,

          behavior: SnackBarBehavior.floating,

          margin: EdgeInsets.all(AppSizes.screenPadding_16),

          duration: const Duration(seconds: 3),

          elevation: 4,

          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSizes.radiusMedium_10),
          ),
        ),
      );
  }

  // ============================================================
  // CONFIRMATION DIALOG
  // ============================================================

  static Future<bool?> showConfirmation(
    BuildContext context, {
    required String title,
    required String message,
    String confirmText = 'Confirm',
    String cancelText = 'Cancel',
  }) {
    return showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (dialogContext) {
        return AlertDialog(
          backgroundColor: AppColors.surface,

          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSizes.dialogRadius_16),
          ),

          title: Text(title, style: AppTextStyles.headingSmall),

          content: Text(message, style: AppTextStyles.bodyMedium),

          actionsPadding: EdgeInsets.fromLTRB(
            AppSizes.spacingMedium_12,
            0,
            AppSizes.spacingMedium_12,
            AppSizes.spacingMedium_12,
          ),

          actions: [
            // ==================================================
            // CANCEL BUTTON
            // ==================================================
            TextButton(
              onPressed: () {
                Navigator.pop(dialogContext, false);
              },
              child: Text(
                cancelText,
                style: AppTextStyles.label.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),
            ),

            // ==================================================
            // CONFIRM BUTTON
            // ==================================================
            ElevatedButton(
              onPressed: () {
                Navigator.pop(dialogContext, true);
              },

              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: AppColors.white,
                elevation: 0,

                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppSizes.radiusSmall_6),
                ),
              ),

              child: Text(confirmText, style: AppTextStyles.button),
            ),
          ],
        );
      },
    );
  }

  // ============================================================
  // DELETE CONFIRMATION
  // ============================================================

  static Future<bool?> showDeleteConfirmation(
    BuildContext context, {
    String title = 'Delete Product?',
    String message = 'Are you sure you want to delete this product?',
  }) {
    return showConfirmation(
      context,
      title: title,
      message: message,
      confirmText: 'Delete',
      cancelText: 'Cancel',
    );
  }
}
