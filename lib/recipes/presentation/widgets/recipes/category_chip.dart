import 'package:flutter/material.dart';

import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_sizer.dart';
import '../../../../core/theming/text_styles.dart';
import '../../../../core/widgets/app_text.dart';
import '../../../domain/entities/category_entity.dart';

class CategoryChip extends StatelessWidget {
  final bool isAll;
  final CategoryEntity category;

  const CategoryChip({super.key, required this.category}) : isAll = false;

  const CategoryChip.all({super.key})
    : category = const CategoryEntity(id: 'All', name: 'All'),
      isAll = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 14.w),
      margin: EdgeInsets.symmetric(horizontal: 4.w),
      decoration: BoxDecoration(
        color: isAll ? AppColors.darkGreen : AppColors.white,
        borderRadius: BorderRadius.circular(999),
      ),
      alignment: Alignment.center,
      child: AppText(
        category.name,
        style: TextStyles.font13SemiBoldDarkGreen.copyWith(
          color: isAll ? AppColors.limeYellow : AppColors.darkGreen,
        ),
      ),
    );
  }
}
