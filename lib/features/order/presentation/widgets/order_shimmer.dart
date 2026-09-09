// Loading placeholders for the My Orders page, built on the shared
// AppShimmer block (same one ProductShimmerList uses).

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../app/theme/app_colors.dart';
import '../../../../app/theme/app_sizes.dart';
import '../../../../core/widgets/app_shimmer.dart';


class OrderCardShimmer extends StatelessWidget {
  const OrderCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: AppSizes.spacingMedium),
      padding: EdgeInsets.all(AppSizes.cardPadding),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppSizes.cardRadius),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppShimmer(
            width: 160.w,
            height: 12.h,
            radius: AppSizes.radiusSmall,
          ),
          SizedBox(height: AppSizes.spacingSmall),
          AppShimmer(
            width: 100.w,
            height: 16.h,
            radius: AppSizes.radiusSmall,
          ),
          SizedBox(height: AppSizes.spacingMedium),
          Row(
            children: [
              Expanded(child: AppShimmer(height: 36.h)),
              SizedBox(width: AppSizes.spacingSmall),
              Expanded(child: AppShimmer(height: 36.h)),
            ],
          ),
          SizedBox(height: AppSizes.spacingMedium),
          Row(
            children: [
              AppShimmer(
                width: AppSizes.avatarLarge,
                height: AppSizes.avatarLarge,
                radius: AppSizes.radiusSmall,
              ),
              SizedBox(width: AppSizes.spacingMedium),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppShimmer(height: 14.h, radius: AppSizes.radiusSmall),
                    SizedBox(height: AppSizes.spacingSmall),
                    AppShimmer(
                      width: 80.w,
                      height: 12.h,
                      radius: AppSizes.radiusSmall,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class OrderListShimmer extends StatelessWidget {
  const OrderListShimmer({super.key, this.itemCount = 4});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.all(AppSizes.spacingMedium),
      itemCount: itemCount,
      itemBuilder: (context, index) => const OrderCardShimmer(),
    );
  }
}
