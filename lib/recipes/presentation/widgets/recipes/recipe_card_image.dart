import 'package:flutter/material.dart';

import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_sizer.dart';
import '../../../../core/widgets/app_image.dart';
import '../../../domain/entities/recipe_entity.dart';
import '../spotlight_section.dart';
import '../time_section.dart';

class RecipeCardImage extends StatelessWidget {
  final RecipeEntity recipe;
  const RecipeCardImage({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Container(
            width: 170.w,
            height: 170.w,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              color: AppColors.gray,
              borderRadius: BorderRadius.circular(12),
            ),
            child: AppImage(recipe.image, fit: BoxFit.cover),
          ),
        ),
        Positioned(
          top: 5,
          left: 5,
          child: SpotlightSection(isFeatured: recipe.isFeatured, id: recipe.id),
        ),
        Positioned(
          bottom: 5,
          left: 5,
          child: TimeSection(minutes: recipe.timeMinutes, id: recipe.id),
        ),
      ],
    );
  }
}
