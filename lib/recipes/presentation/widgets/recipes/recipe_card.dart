import 'package:flutter/material.dart';

import '../../../../core/routing/app_routes.dart';
import '../../../../core/theming/app_sizer.dart';
import '../../../../core/theming/text_styles.dart';
import '../../../../core/widgets/app_card.dart';
import '../../../../core/widgets/app_text.dart';
import '../../../../core/widgets/custom_inkwell.dart';
import '../../../domain/entities/recipe_entity.dart';
import '../creator_section.dart';
import 'recipe_card_image.dart';

class RecipeCard extends StatelessWidget {
  final RecipeEntity recipe;
  const RecipeCard(this.recipe, {super.key});

  @override
  Widget build(BuildContext context) {
    return CustomInkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          AppRoutes.recipeDetails,
          arguments: recipe.id,
        );
      },
      child: AppCard(
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RecipeCardImage(recipe: recipe),
            Expanded(
              child: AppText(
                recipe.name,
                style: TextStyles.font16MediumBlack,
                maxLines: 2,
              ),
            ),
            SizedBox(height: 8.h),
            CreatorSection(
              creatorName: recipe.creatorName,
              creatorImage: recipe.creatorImage,
              creatorLink: recipe.creatorLink,
            ),
          ],
        ),
      ),
    );
  }
}
