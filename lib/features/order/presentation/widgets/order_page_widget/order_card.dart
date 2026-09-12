import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../app/theme/app_colors.dart';
import '../../../../../app/theme/app_sizes.dart';

import '../../../model/order_model.dart';

import 'order_action_button.dart';

import 'order_item_title.dart';
import 'order_status_row.dart';

class OrderCard extends StatelessWidget {
  const OrderCard({
    super.key,
    required this.order,
    required this.onCancel,
    required this.onView,
    this.onItemTap,
  });

  final OrderModel order;
  final VoidCallback onCancel;
  final VoidCallback onView;
  final void Function(OrderItemModel item)? onItemTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: AppSizes.spacingMedium),
      padding: EdgeInsets.all(AppSizes.cardPadding),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppSizes.cardRadius),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Lalbaba's own order number, labelled the way Nykaa labels it.
          Text(
            'Order ID: ${order.orderId}',
            style: TextStyle(fontSize: 12.sp, color: AppColors.textSecondary),
          ),
          SizedBox(height: AppSizes.spacingSmall),

          OrderStatusRow(order: order),
          SizedBox(height: AppSizes.spacingMedium),

          // Cancel Order / View Order — start of the card, above the items.
          OrderActionButtons(order: order, onCancel: onCancel, onView: onView),
          SizedBox(height: AppSizes.spacingSmall),

          Divider(color: AppColors.divider, height: 1),

          // Every ordered product gets its own tile inside this one card.
          for (final item in order.items) ...[
            OrderItemTile(
              item: item,
              onTap: onItemTap == null ? null : () => onItemTap!(item),
            ),
            if (item != order.items.last)
              Divider(color: AppColors.divider, height: 1),
          ],
        ],
      ),
    );
  }
}
