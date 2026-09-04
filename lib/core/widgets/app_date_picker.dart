// Reusable application date picker.
// Why: Keeps date selection UI consistent across the application.

import 'package:flutter/material.dart';

import '../../app/theme/app_colors.dart';
import '../../app/theme/app_text_styles.dart';
import '../constants/app_sizes.dart';

class AppDatePicker extends StatelessWidget {
  const AppDatePicker({
    super.key,
    required this.selectedDate,
    required this.onDateSelected,
    this.firstDate,
    this.lastDate,
    this.label = 'Select Date',
    this.hint = 'Choose a date',
  });

  final DateTime? selectedDate;
  final ValueChanged<DateTime> onDateSelected;

  final DateTime? firstDate;
  final DateTime? lastDate;

  final String label;
  final String hint;

  String _formatDate(DateTime? date) {
    if (date == null) {
      return hint;
    }

    return '${date.day.toString().padLeft(2, '0')}/'
        '${date.month.toString().padLeft(2, '0')}/'
        '${date.year}';
  }

  Future<void> _pickDate(BuildContext context) async {
    final now = DateTime.now();

    final pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? now,
      firstDate: firstDate ?? DateTime(2000),
      lastDate: lastDate ?? DateTime(2100),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: AppColors.primary,
              onPrimary: AppColors.white,
              surface: AppColors.surface,
              onSurface: AppColors.textPrimary,
            ),
          ),
          child: child!,
        );
      },
    );

    if (pickedDate != null) {
      onDateSelected(pickedDate);
    }
  }

  @override
  Widget build(BuildContext context) {
    final hasDate = selectedDate != null;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: AppTextStyles.label),
        SizedBox(height: AppSizes.spacingSmall_8),
        InkWell(
          onTap: () => _pickDate(context),
          borderRadius: BorderRadius.circular(AppSizes.radiusMedium_10),
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(
              horizontal: AppSizes.spacingMedium_12,
              vertical: AppSizes.spacingMedium_12,
            ),
            decoration: BoxDecoration(
              color: AppColors.surface,
              border: Border.all(color: AppColors.border),
              borderRadius: BorderRadius.circular(AppSizes.radiusMedium_10),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.calendar_today_outlined,
                  size: AppSizes.iconMedium_24,
                  color: AppColors.primary,
                ),
                SizedBox(width: AppSizes.spacingMedium_12),
                Expanded(
                  child: Text(
                    _formatDate(selectedDate),
                    style: hasDate
                        ? AppTextStyles.bodyMedium
                        : AppTextStyles.searchHint,
                  ),
                ),
                Icon(
                  Icons.keyboard_arrow_down_rounded,
                  size: AppSizes.iconMedium_24,
                  color: AppColors.textSecondary,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
