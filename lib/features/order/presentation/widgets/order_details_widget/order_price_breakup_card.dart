import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../app/theme/app_colors.dart';
import '../../../../../app/theme/app_sizes.dart';
import '../../../model/order_model.dart';

class OrderPriceBreakupCard extends StatelessWidget {
  const OrderPriceBreakupCard({super.key, required this.order});

  final OrderModel order;

  @override
  Widget build(BuildContext context) {
    final breakup = order.priceBreakup;

    return Container(
      width: double.infinity,
      color: AppColors.surface,
      padding: EdgeInsets.symmetric(vertical: AppSizes.spacingSmall),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          initiallyExpanded: true,
          backgroundColor: AppColors.surface,
          collapsedBackgroundColor: AppColors.surface,
          tilePadding: EdgeInsets.symmetric(horizontal: AppSizes.cardPadding),
          childrenPadding: EdgeInsets.symmetric(horizontal: AppSizes.cardPadding),
          title: Row(
            children: [
              Text(
                '₹${breakup.orderTotal.toStringAsFixed(0)}',
                style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w700, color: AppColors.textPrimary),
              ),
              SizedBox(width: AppSizes.spacingSmall),
              if (breakup.youSaved > 0)
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                  decoration: BoxDecoration(
                    color: AppColors.secondaryLight,
                    borderRadius: BorderRadius.circular(AppSizes.radiusXLarge),
                  ),
                  child: Text(
                    'You saved ₹${breakup.youSaved.toStringAsFixed(0)}',
                    style: TextStyle(fontSize: 11.5.sp, fontWeight: FontWeight.w600, color: AppColors.secondary),
                  ),
                ),
            ],
          ),
          children: [
            _priceRow('Total MRP', breakup.totalMrp),
            _priceRow('Discounted Total MRP', breakup.discountedTotalMrp),
            _priceRow('Tax', breakup.tax),
            _priceRow('Shipping Charges', breakup.shippingCharges),
            Divider(color: AppColors.divider, height: AppSizes.spacingLarge),
            _priceRow('Order Total', breakup.orderTotal, isBold: true),
            SizedBox(height: AppSizes.spacingSmall),
          ],
        ),
      ),
    );
  }

  Widget _priceRow(String label, double value, {bool isBold = false}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 6.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 13.sp,
              fontWeight: isBold ? FontWeight.w700 : FontWeight.normal,
              color: isBold ? AppColors.textPrimary : AppColors.textSecondary,
            ),
          ),
          Text(
            '₹${value.toStringAsFixed(0)}',
            style: TextStyle(fontSize: 13.sp, fontWeight: isBold ? FontWeight.w700 : FontWeight.normal, color: AppColors.textPrimary),
          ),
        ],
      ),
    );
  }
}
