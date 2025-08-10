import 'package:flutter/material.dart';

import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_sizer.dart';
import '../../../../core/theming/text_styles.dart';
import '../../../../core/widgets/app_text.dart';
import '../../../domain/entities/detailed_recipe_entity.dart';
import '../creator_section.dart';
import '../spotlight_section.dart';
import '../time_section.dart';
import 'add_ingredients_to_cart_tile.dart';
import 'ingredients_and_instructions_section.dart';
import 'recipe_details_app_bar.dart';

class RecipeDetailsContent extends StatelessWidget {
  final DetailedRecipeEntity detailedRecipe;
  final ScrollController scrollController;
  const RecipeDetailsContent({
    super.key,
    required this.detailedRecipe,
    required this.scrollController,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        CustomScrollView(
          controller: scrollController,
          physics: const BouncingScrollPhysics(),
          slivers: [
            RecipeDetailsAppBar(
              detailedRecipe: detailedRecipe,
              scrollController: scrollController,
            ),

            // Title + description + ingredients section
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 96.h),
                // bottom padding leaves room for the persistent CTA when visible
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SpotlightSection(
                      id: detailedRecipe.id,
                      isFeatured: detailedRecipe.isFeatured,
                    ),
                    SizedBox(height: 8.h),
                    AppText(
                      detailedRecipe.name,
                      maxLines: 2,
                      style: TextStyles.font20BoldBlack,
                    ),
                    SizedBox(height: 8.h),
                    Row(
                      children: [
                        Expanded(
                          child: CreatorSection.details(
                            creatorName: detailedRecipe.creatorName,
                            creatorImage: detailedRecipe.creatorImage,
                            creatorLink: detailedRecipe.creatorLink,
                          ),
                        ),
                        TimeSection(
                          id: detailedRecipe.id,
                          minutes: detailedRecipe.timeMinutes,
                          backgroundColor: AppColors.gray,
                        ),
                      ],
                    ),
                    SizedBox(height: 24.h),
                    IngredientsAndInstructionsSection(
                      detailedRecipe: detailedRecipe,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        AddIngredientsToCartTile(count: detailedRecipe.inStockItemsCount),
      ],
    );
  }
}
