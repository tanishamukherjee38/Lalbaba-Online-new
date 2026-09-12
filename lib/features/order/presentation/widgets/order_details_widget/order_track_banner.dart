import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../app/theme/app_colors.dart';
import '../../../../../app/theme/app_sizes.dart';
import '../../../model/order_model.dart';
import 'track_order_sheet.dart';



class OrderTrackBanner extends StatelessWidget {
  const OrderTrackBanner({super.key, required this.order});

  final OrderModel order;

  @override
  Widget build(BuildContext context) {
    if (order.trackingEvents.isEmpty) return const SizedBox.shrink();

    final latest = order.trackingEvents.last;

    return Container(
      width: double.infinity,
      color: AppColors.surface,
      padding: EdgeInsets.symmetric(
        horizontal: AppSizes.cardPadding,
        vertical: AppSizes.spacingMedium,
      ),
      child: Row(
        children: [
          Icon(Icons.local_shipping_outlined, color: AppColors.primary, size: AppSizes.iconMedium),
          SizedBox(width: AppSizes.spacingMedium),
          Expanded(
            child: Text(
              latest.description,
              style: TextStyle(fontSize: 13.sp, color: AppColors.textPrimary),
            ),
          ),
          GestureDetector(
            onTap: () => showTrackOrderSheet(context, order),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 8.h),
              decoration: BoxDecoration(
                color: AppColors.primaryLight,
                borderRadius: BorderRadius.circular(AppSizes.radiusXLarge),
              ),
              child: Text(
                'Track Order',
                style: TextStyle(
                  fontSize: 12.5.sp,
                  fontWeight: FontWeight.w700,
                  color: AppColors.primary,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
