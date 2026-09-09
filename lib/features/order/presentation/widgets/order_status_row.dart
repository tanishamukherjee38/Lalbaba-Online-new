// "Delivered" / "Processing" heading + date + On Time pill.
// Mirrors the Nykaa order card's status block.

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../app/theme/app_colors.dart';
import '../../../../app/theme/app_sizes.dart';
import '../../../../core/utils/date_utils.dart';

import '../../model/order_model.dart';


class OrderStatusRow extends StatelessWidget {
  const OrderStatusRow({super.key, required this.order});

  final OrderModel order;

  @override
  Widget build(BuildContext context) {
    final isDelivered = order.status == OrderStatus.delivered;
    final dateLabel = isDelivered && order.deliveredDate != null
        ? 'On ${DateUtilsHelper.formatDate(order.deliveredDate!)}'
        : DateUtilsHelper.formatDate(order.orderDate);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                _statusLabel(order.status),
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                  color: order.status == OrderStatus.cancelled
                      ? AppColors.error
                      : AppColors.textPrimary,
                ),
              ),
              SizedBox(height: 2.h),
              Text(
                dateLabel,
                style: TextStyle(
                  fontSize: 13.sp,
                  color: AppColors.textSecondary,
                ),
              ),
            ],
          ),
        ),
        if (isDelivered)
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
            decoration: BoxDecoration(
              color: order.onTime
                  ? AppColors.secondaryLight
                  : AppColors.primaryLight,
              borderRadius: BorderRadius.circular(AppSizes.radiusSmall),
            ),
            child: Text(
              order.onTime ? 'On Time' : 'Delayed',
              style: TextStyle(
                fontSize: 11.sp,
                fontWeight: FontWeight.w600,
                color: order.onTime ? AppColors.secondary : AppColors.error,
              ),
            ),
          ),
      ],
    );
  }

  String _statusLabel(OrderStatus status) {
    switch (status) {
      case OrderStatus.delivered:
        return 'Delivered';
      case OrderStatus.processing:
        return 'Processing';
      case OrderStatus.shipped:
        return 'Shipped';
      case OrderStatus.cancelled:
        return 'Cancelled';
    }
  }
}
