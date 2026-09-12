

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../app/theme/app_colors.dart';
import '../../../../../app/theme/app_sizes.dart';
import '../../../model/order_model.dart';


class OrderItemTile extends StatelessWidget {
  const OrderItemTile({super.key, required this.item, this.onTap});

  final OrderItemModel item;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: AppSizes.spacingSmall),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(AppSizes.radiusSmall),
                  child: Image.network(
                    item.imageUrl,
                    width: AppSizes.avatarLarge,
                    height: AppSizes.avatarLarge,
                    fit: BoxFit.cover,
                    loadingBuilder: (context, child, progress) {
                      if (progress == null) return child;
                      return Container(
                        width: AppSizes.avatarLarge,
                        height: AppSizes.avatarLarge,
                        color: AppColors.disabledBackground,
                      );
                    },
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
                ],
            ),
            SizedBox(width: AppSizes.spacingMedium),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    item.weight,
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.chevron_right,
              color: AppColors.textHint,
              size: AppSizes.iconSmall,
            ),
          ],
        ),
      ),
    );
  }
}
