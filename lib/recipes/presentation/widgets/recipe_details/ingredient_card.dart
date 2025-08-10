import 'package:flutter/material.dart';

import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_sizer.dart';
import '../../../../core/theming/text_styles.dart';
import '../../../../core/widgets/app_image.dart';
import '../../../../core/widgets/app_text.dart';
import '../../../domain/entities/detailed_recipe_entity.dart';

class IngredientCard extends StatelessWidget {
  final IngredientEntity ingredient;
  const IngredientCard({super.key, required this.ingredient});

  bool get inStock => product.inStock;
  ProductEntity get product => ingredient.product;
  int get replenishmentDays => product.replenishmentTime;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Image
        ClipRRect(
          borderRadius: BorderRadius.circular(8.w),
          child: SizedBox(
            width: 52.w,
            height: 52.w,
            child:
                product.imageUrl == null
                    ? const SizedBox.shrink()
                    : AppImage(product.imageUrl!, fit: BoxFit.contain),
          ),
        ),
        SizedBox(width: 12.w),

        // Title + quantity and (maybe) Back in X days badge
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 4.h,
            children: [
              Row(
                children: [
                  Expanded(
                    child: AppText(
                      product.name,
                      maxLines: 2,
                      style: TextStyles.font13RegularBlack,
                    ),
                  ),
                  if (!inStock) _BackInBadge(days: replenishmentDays),
                ],
              ),
              AppText(
                _quantityLabel(product),
                style: TextStyles.font12SemiBoldBlack.copyWith(
                  fontStyle: FontStyle.italic,
                ),
              ),
            ],
          ),
        ),

        if (inStock) ...[
          AppText(
            '${product.basePrice.toStringAsFixed(2)} EGP',
            style: TextStyles.font14MediumDarkGray,
          ),
          SizedBox(width: 6.w),
          _SuccessTick(),
        ],
      ],
    );
  }

  String _quantityLabel(ProductEntity product) {
    return '1 x ${product.unitValue} ${product.unit}';
  }
}

class _BackInBadge extends StatelessWidget {
  final int days;
  const _BackInBadge({required this.days});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
      decoration: BoxDecoration(
        color: AppColors.gray,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(8.w),
          topRight: Radius.circular(8.w),
          bottomRight: Radius.circular(8.w),
        ),
      ),
      child: AppText(_label, style: TextStyles.font10MediumDarkGray),
    );
  }

  String get _label {
    // remove s in case of 1 day
    return 'Back in $days Day${days == 1 ? '' : 's'}!';
  }
}

class _SuccessTick extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 22.w,
      height: 22.w,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.darkGreen,
      ),
      alignment: Alignment.center,
      child: Icon(Icons.check, color: AppColors.white, size: 16.w),
    );
  }
}
