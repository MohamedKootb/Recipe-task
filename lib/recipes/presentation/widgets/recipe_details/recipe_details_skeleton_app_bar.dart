import 'package:flutter/material.dart';

import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_sizer.dart';
import '../../../../core/utils/constants.dart';
import '../../../../core/widgets/app_image.dart';
import '../../../../core/widgets/custom_inkwell.dart';

class RecipeDetailsSkeletonAppBar extends StatelessWidget {
  const RecipeDetailsSkeletonAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      expandedHeight: 300.h,
      scrolledUnderElevation: 2,
      surfaceTintColor: AppColors.white,
      backgroundColor: AppColors.white,
      shadowColor: AppColors.lightGray,
      leading: Padding(
        padding: EdgeInsets.only(left: 8.w),
        child: CustomInkWell(
          child: Icon(
            Icons.arrow_back_ios_new_rounded,
            size: 20.w,
            color: AppColors.black,
          ),
          onTap: () => Navigator.of(context).maybePop(),
        ),
      ),
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: false,
        collapseMode: CollapseMode.none,
        background: Stack(
          fit: StackFit.expand,
          alignment: Alignment.center,
          children: [AppImage(Constants.placeholder, fit: BoxFit.cover)],
        ),
      ),
    );
  }
}
