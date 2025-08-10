import 'package:flutter/material.dart';

import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_sizer.dart';
import '../../../../core/theming/text_styles.dart';
import '../../../../core/widgets/app_image.dart';
import '../../../../core/widgets/app_text.dart';
import '../../../../core/widgets/dotted_divider.dart';
import '../../../domain/entities/detailed_recipe_entity.dart';

class StepsSection extends StatelessWidget {
  final List<StepEntity> steps;
  const StepsSection({super.key, required this.steps});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (final s in steps) _StepTile(step: s, isLast: s == steps.last),
      ],
    );
  }
}

class _StepTile extends StatelessWidget {
  final StepEntity step;
  final bool isLast;
  const _StepTile({required this.step, required this.isLast});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 20.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // STEP Header + Step number
          Row(
            children: [
              AppText('STEP', style: TextStyles.font14ExtraBoldBlack),
              SizedBox(width: 8.w),
              CircleAvatar(
                radius: 14.w,
                backgroundColor: AppColors.darkGreen,
                child: AppText(
                  step.stepNum.toString(),
                  style: TextStyles.font16BoldBlack.copyWith(
                    color: AppColors.limeYellow,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          // Optional image
          if (step.image != null) ...[
            ClipRRect(
              borderRadius: BorderRadius.circular(12.w),
              child: AppImage(
                step.image!,
                height: 180.h,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
            SizedBox(height: 8.h),
          ],
          // Description
          AppText(
            step.description ?? '-',
            maxLines: 10,
            style: TextStyles.font14MediumBlack,
          ),
          // Dotted divider
          if (!isLast)
            DottedDivider(
              margin: EdgeInsets.symmetric(vertical: 12.h),
              color: AppColors.black.withValues(alpha: 0.12),
            ),
        ],
      ),
    );
  }
}
