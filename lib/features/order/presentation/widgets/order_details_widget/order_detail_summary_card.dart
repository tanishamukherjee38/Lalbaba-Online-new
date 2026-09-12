import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../app/theme/app_colors.dart';
import '../../../../../app/theme/app_sizes.dart';
import '../../../../../core/utils/date_utils.dart';
import '../../../model/order_model.dart';
import 'order_detail_item_row.dart';



class OrderDetailSummaryCard extends StatelessWidget {
  const OrderDetailSummaryCard({super.key, required this.order});

  final OrderModel order;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: AppColors.surface,
      padding: EdgeInsets.all(AppSizes.cardPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Order ID: ${order.orderId}',
            style: TextStyle(fontSize: 12.sp, color: AppColors.textSecondary),
          ),
          SizedBox(height: AppSizes.spacingMedium),
          for (final item in order.items) ...[
            OrderDetailItemRow(item: item),
            if (item != order.items.last) SizedBox(height: AppSizes.spacingMedium),
          ],
          SizedBox(height: AppSizes.spacingLarge),
          Divider(color: AppColors.divider, height: 1),
          SizedBox(height: AppSizes.spacingLarge),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  _headline(),
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    color: order.status == OrderStatus.cancelled
                        ? AppColors.error
                        : AppColors.textPrimary,
                  ),
                ),
              ),
              if (order.status == OrderStatus.delivered)
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
                  decoration: BoxDecoration(
                    color: order.onTime ? AppColors.secondaryLight : AppColors.primaryLight,
                    borderRadius: BorderRadius.circular(AppSizes.radiusXLarge),
                  ),
                  child: Text(
                    order.onTime ? 'Early Delivery' : 'Delayed',
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600,
                      color: order.onTime ? AppColors.secondary : AppColors.error,
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }

  String _headline() {
    switch (order.status) {
      case OrderStatus.delivered:
        return 'Delivered On ${DateUtilsHelper.formatDate(order.deliveredDate ?? order.orderDate)}';
      case OrderStatus.shipped:
        return 'Shipped, arriving soon';
      case OrderStatus.processing:
        return 'Order Confirmed';
      case OrderStatus.cancelled:
        return 'Order Cancelled';
    }
  }


}
