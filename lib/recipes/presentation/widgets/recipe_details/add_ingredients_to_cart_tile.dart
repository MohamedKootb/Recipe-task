import 'dart:async';

import 'package:flutter/material.dart';

import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_sizer.dart';
import '../../../../core/theming/text_styles.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/event_bus.dart';
import '../../../../core/widgets/app_image.dart';
import '../../../../core/widgets/app_text.dart';
import '../../events/ingredients_mode_changed.dart';

class AddIngredientsToCartTile extends StatefulWidget {
  final int count;
  const AddIngredientsToCartTile({super.key, required this.count});

  @override
  State<AddIngredientsToCartTile> createState() =>
      _AddIngredientsToCartTileState();
}

class _AddIngredientsToCartTileState extends State<AddIngredientsToCartTile> {
  bool _isIngredientsMode = true;
  StreamSubscription? _ingredientsSub;

  @override
  void initState() {
    super.initState();
    _ingredientsSub = eventBus.on<IngredientsModeChangedEvent>().listen((e) {
      if (!mounted) return;
      setState(() => _isIngredientsMode = e.isIngredients);
    });
  }

  @override
  void dispose() {
    _ingredientsSub?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!_isIngredientsMode) return const SizedBox.shrink();

    return Container(
      color: AppColors.white,
      padding: EdgeInsets.symmetric(vertical: 16.h),
      child: Row(
        children: [
          SizedBox(width: 25.w),
          Container(
            height: 50.h,
            decoration: BoxDecoration(
              color: AppColors.limeYellow,
              borderRadius: BorderRadius.circular(26.w),
            ),
            padding: EdgeInsets.symmetric(horizontal: 18.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 34.w,
                  height: 34.w,
                  decoration: const BoxDecoration(
                    color: AppColors.darkGreen,
                    shape: BoxShape.circle,
                  ),
                  alignment: Alignment.center,
                  child: AppText(
                    '${widget.count}',
                    style: TextStyles.font13SemiBoldBlack.copyWith(
                      color: AppColors.limeYellow,
                    ),
                  ),
                ),
                Container(width: 12.w),
                AppText(
                  'Add ingredients to cart',
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  style: TextStyles.font16SemiBoldBlack.copyWith(
                    color: AppColors.darkGreen,
                  ),
                ),
              ],
            ),
          ),

          SizedBox(width: 25.w),
          const Spacer(),
          Container(
            height: 50.h,
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            decoration: const BoxDecoration(
              color: AppColors.darkGreen,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(999),
                bottomLeft: Radius.circular(999),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.only(right: 12.w),
              child: AppImage(
                AppAssets.basket,
                color: AppColors.limeYellow,
                width: 24.w,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
