import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../app/theme/app_colors.dart';
import '../../../../../app/theme/app_sizes.dart';
import '../../../../../core/utils/date_utils.dart';
import '../../../model/order_model.dart';


class TrackingStepTile extends StatelessWidget {
  const TrackingStepTile({super.key, required this.event, required this.isLast});

  final TrackingEvent event;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    final color = event.state == TrackingState.pending ? AppColors.disabled : AppColors.secondary;

    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Container(
                width: 12.w,
                height: 12.w,
                margin: EdgeInsets.only(top: 4.h),
                decoration: BoxDecoration(
                  color: event.state == TrackingState.pending ? AppColors.surface : color,
                  shape: BoxShape.circle,
                  border: Border.all(color: color, width: 2),
                ),
                child: event.state == TrackingState.completed
                    ? Icon(Icons.check, color: AppColors.white, size: 8.sp)
                    : null,
              ),
              if (!isLast)
                Expanded(
                  child: Container(
                    width: 2,
                    color: event.state == TrackingState.pending ? AppColors.border : AppColors.secondary,
                  ),
                ),
            ],
          ),
          SizedBox(width: AppSizes.spacingMedium),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(bottom: AppSizes.spacingLarge),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    event.title,
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w700,
                      color: event.state == TrackingState.pending
                          ? AppColors.textHint
                          : AppColors.textPrimary,
                    ),
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    event.description,
                    style: TextStyle(fontSize: 12.5.sp, color: AppColors.textSecondary),
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    DateUtilsHelper.formatDateTime(event.timestamp),
                    style: TextStyle(fontSize: 11.5.sp, color: AppColors.textHint),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
