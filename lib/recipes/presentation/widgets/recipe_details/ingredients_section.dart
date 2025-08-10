import 'package:flutter/material.dart';

import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_sizer.dart';
import '../../../../core/theming/text_styles.dart';
import '../../../../core/widgets/app_text.dart';
import '../../../domain/entities/detailed_recipe_entity.dart';
import 'ingredient_card.dart';

class IngredientsSection extends StatelessWidget {
  final List<IngredientEntity> ingredients;
  const IngredientsSection({super.key, required this.ingredients});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Ingredients list
        for (int i = 0; i < ingredients.length; i++) ...[
          IngredientCard(ingredient: ingredients[i]),
          Container(
            height: 1.h,
            margin: EdgeInsets.symmetric(vertical: 6.h),
            width: double.infinity,
            color: AppColors.gray,
          ),
        ],

        // Save to a list tile
        const _SaveToListTile(),
        SizedBox(height: 16.h),
      ],
    );
  }
}

class _SaveToListTile extends StatelessWidget {
  const _SaveToListTile();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.list, color: AppColors.darkGreen, size: 20.w),
          SizedBox(width: 8.w),
          AppText(
            'Save to a list',
            style: TextStyles.font16SemiBoldBlack.copyWith(
              color: AppColors.darkGreen,
            ),
          ),
        ],
      ),
    );
  }
}

class AddIngredientsToCartTile extends StatelessWidget {
  final int count;
  const AddIngredientsToCartTile({super.key, required this.count});

  @override
  Widget build(BuildContext context) {
    // Moved to its own file to be reusable at screen level
    throw UnimplementedError('Use add_ingredients_to_cart_tile.dart');
  }
}
