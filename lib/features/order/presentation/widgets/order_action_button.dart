// "Cancel Order" / "View Order" button row, shown at the top of the card
// (matches the Lalbaba orders page buttons).

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../app/theme/app_colors.dart';
import '../../../../app/theme/app_sizes.dart';

import '../../model/order_model.dart';


class OrderActionButtons extends StatelessWidget {
  const OrderActionButtons({
    super.key,
    required this.order,
    required this.onCancel,
    required this.onView,
  });

  final OrderModel order;
  final VoidCallback onCancel;
  final VoidCallback onView;

  bool get _canCancel =>
      order.status == OrderStatus.processing ||
      order.status == OrderStatus.shipped;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (_canCancel) ...[
          Expanded(
            child: OutlinedButton(
              onPressed: onCancel,
              style: OutlinedButton.styleFrom(
                foregroundColor: AppColors.primary,
                side: const BorderSide(color: AppColors.primary),
                padding: EdgeInsets.symmetric(vertical: 10.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppSizes.radiusSmall),
                ),
              ),
              child: Text('Cancel Order', style: TextStyle(fontSize: 13.sp)),
            ),
          ),
          SizedBox(width: AppSizes.spacingSmall),
        ],
        Expanded(
          child: ElevatedButton(
            onPressed: onView,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.grey,
              foregroundColor: AppColors.white,
              padding: EdgeInsets.symmetric(vertical: 10.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppSizes.radiusSmall),
              ),
            ),
            child: Text('View Order', style: TextStyle(fontSize: 13.sp)),
          ),
        ),
      ],
    );
  }
}
