import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../app/theme/app_colors.dart';
import '../../../../../app/theme/app_sizes.dart';

import '../../../model/order_model.dart';
import 'tracking_step_tile.dart';


Future<void> showTrackOrderSheet(BuildContext context, OrderModel order) {
  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) => TrackOrderSheet(order: order),
  );
}

class TrackOrderSheet extends StatelessWidget {
  const TrackOrderSheet({super.key, required this.order});

  final OrderModel order;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.78,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.vertical(top: Radius.circular(AppSizes.radiusXLarge)),
        ),
        child: Column(
          children: [
            SizedBox(height: AppSizes.spacingSmall),
            Container(
              width: 40.w,
              height: 4.h,
              decoration: BoxDecoration(
                color: AppColors.border,
                borderRadius: BorderRadius.circular(AppSizes.radiusSmall),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(
                AppSizes.cardPadding,
                AppSizes.spacingLarge,
                AppSizes.cardPadding,
                0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Tracking Details',
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                          color: AppColors.textPrimary,
                        ),
                      ),
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Icon(Icons.close, color: AppColors.textSecondary, size: AppSizes.iconMedium),
                      ),
                    ],
                  ),
                  SizedBox(height: AppSizes.spacingMedium),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(AppSizes.cardPadding),
                    decoration: BoxDecoration(
                      color: AppColors.background,
                      borderRadius: BorderRadius.circular(AppSizes.radiusMedium),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: _labelValue('Delivery Partner', order.deliveryPartner),
                        ),
                        Container(width: 1, height: 32.h, color: AppColors.border),
                        SizedBox(width: AppSizes.spacingMedium),
                        Expanded(
                          child: Row(
                            children: [
                              Expanded(child: _labelValue('Tracking ID', order.trackingId)),
                              GestureDetector(
                                onTap: () => Clipboard.setData(ClipboardData(text: order.trackingId)),
                                child: Icon(
                                  Icons.copy_outlined,
                                  size: AppSizes.iconSmall,
                                  color: AppColors.textSecondary,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: AppSizes.spacingMedium),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.fromLTRB(
                  AppSizes.cardPadding,
                  0,
                  AppSizes.cardPadding,
                  AppSizes.spacingLarge,
                ),
                itemCount: order.trackingEvents.length,
                itemBuilder: (context, index) => TrackingStepTile(
                  event: order.trackingEvents[index],
                  isLast: index == order.trackingEvents.length - 1,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _labelValue(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(fontSize: 11.5.sp, color: AppColors.textSecondary)),
        SizedBox(height: 2.h),
        Text(
          value,
          style: TextStyle(fontSize: 13.5.sp, fontWeight: FontWeight.w700, color: AppColors.textPrimary),
        ),
      ],
    );
  }
}
