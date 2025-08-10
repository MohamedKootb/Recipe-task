import 'package:flutter/material.dart';

import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_sizer.dart';
import '../../../../core/theming/text_styles.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/widgets/app_image.dart';
import '../../../../core/widgets/app_text.dart';

class RecipesAppBarTitle extends StatelessWidget {
  const RecipesAppBarTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(25.w),
          child: AppImage(AppAssets.logo, width: 50.w, fit: BoxFit.cover),
        ),
        SizedBox(width: 12.w),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppText('Rabbit Recipes', style: TextStyles.font24BlackDarkGreen),
            AppText(
              'Get it fast. make it faster!',
              style: TextStyles.font12SemiBoldDarkGreen,
            ),
          ],
        ),
        const Spacer(),
        Container(
          width: 50.w,
          height: 50.w,
          decoration: const BoxDecoration(
            color: AppColors.white,
            shape: BoxShape.circle,
          ),
          // X icon
          child: Icon(Icons.close, size: 36.w, color: AppColors.darkGreen),
        ),
      ],
    );
  }
}
