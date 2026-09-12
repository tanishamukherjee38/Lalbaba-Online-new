import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../app/theme/app_colors.dart';
import '../../../../../app/theme/app_sizes.dart';
import '../../../model/order_model.dart';


class OrderDetailItemRow extends StatelessWidget {
  const OrderDetailItemRow({super.key, required this.item});

  final OrderItemModel item;

  @override
  Widget build(BuildContext context) {
    final hasDiscount = item.discountedMrp < item.mrp;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(AppSizes.radiusSmall),
          child: Image.network(
            item.imageUrl,
            width: AppSizes.avatarLarge,
            height: AppSizes.avatarLarge,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) => Container(
              width: AppSizes.avatarLarge,
              height: AppSizes.avatarLarge,
              color: AppColors.disabledBackground,
              child: Icon(
                Icons.image_not_supported_outlined,
                color: AppColors.disabled,
                size: AppSizes.iconSmall,
              ),
            ),
          ),
        ),
        SizedBox(width: AppSizes.spacingMedium),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item.name,
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textPrimary,
                ),
              ),
              SizedBox(height: 4.h),
              Text(
                item.weight,
                style: TextStyle(fontSize: 12.sp, color: AppColors.textSecondary),
              ),
              SizedBox(height: 4.h),
              Row(
                children: [
                  Text(
                    '₹${item.discountedMrp.toStringAsFixed(0)}',
                    style: TextStyle(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  if (hasDiscount) ...[
                    SizedBox(width: 6.w),
                    Text(
                      '₹${item.mrp.toStringAsFixed(0)}',
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: AppColors.textHint,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                  ],
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
