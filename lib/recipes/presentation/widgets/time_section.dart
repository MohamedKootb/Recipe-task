import 'package:flutter/material.dart';

import '../../../core/theming/app_colors.dart';
import '../../../core/theming/app_sizer.dart';
import '../../../core/theming/text_styles.dart';
import '../../../core/widgets/app_text.dart';

class TimeSection extends StatelessWidget {
  final int minutes;
  final int id;
  final Color? backgroundColor;
  const TimeSection({
    super.key,
    required this.minutes,
    required this.id,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    final time = minutes;
    if (time <= 0) return const SizedBox.shrink();

    return Container(
      width: 90.w,
      padding: EdgeInsets.symmetric(vertical: 4.h),
      decoration: BoxDecoration(
        color: backgroundColor ?? AppColors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.access_time, size: 16.w, color: AppColors.black),
            SizedBox(width: 4.w),
            AppText(
              '$time mins',
              style: TextStyles.font12ExtraBoldDarkGreen.copyWith(
                color: AppColors.black,
                fontWeight: FontWeightHelper.semiBold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
