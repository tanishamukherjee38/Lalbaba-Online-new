// Reusable shimmer loading widgets.
// Why: Shows a consistent loading placeholder while data is being fetched.

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import '../../app/theme/app_colors.dart';
import '../constants/app_sizes.dart';

/*
const AppShimmer(
  height: 50,
)

const ProductShimmerList(
  itemCount: 6,
)

if (isLoading) {
  return const ProductShimmerList();
}

return ProductGrid(
  products: products,
);

*/
class AppShimmer extends StatelessWidget {
  const AppShimmer({super.key, this.width, this.height, this.radius});

  final double? width;
  final double? height;
  final double? radius;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.disabledBackground,
      highlightColor: AppColors.surface,
      child: Container(
        width: width ?? double.infinity,
        height: height ?? AppSizes.inputHeight_50,
        decoration: BoxDecoration(
          color: AppColors.disabledBackground,
          borderRadius: BorderRadius.circular(
            radius ?? AppSizes.radiusMedium_10,
          ),
        ),
      ),
    );
  }
}

// Shimmer for a single product card.
class ProductShimmer extends StatelessWidget {
  const ProductShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppSizes.cardPadding_12),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppSizes.radiusLarge_12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AspectRatio(
            aspectRatio: 1,
            child: AppShimmer(radius: AppSizes.radiusMedium_10),
          ),

          SizedBox(height: AppSizes.spacingSmall_8),

          AppShimmer(
            width: 120.w,
            height: 14.h,
            radius: AppSizes.radiusSmall_6,
          ),

          SizedBox(height: AppSizes.spacingSmall_8),

          AppShimmer(width: 80.w, height: 14.h, radius: AppSizes.radiusSmall_6),

          SizedBox(height: AppSizes.spacingSmall_8),

          AppShimmer(
            width: double.infinity,
            height: 36.h,
            radius: AppSizes.radiusSmall_6,
          ),
        ],
      ),
    );
  }
}

// Shimmer list for multiple products.
class ProductShimmerList extends StatelessWidget {
  const ProductShimmerList({super.key, this.itemCount = 6});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: itemCount,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: AppSizes.spacingMedium_12,
        mainAxisSpacing: AppSizes.spacingMedium_12,
        childAspectRatio: 0.72,
      ),
      itemBuilder: (context, index) {
        return const ProductShimmer();
      },
    );
  }
}
