import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theming/app_sizer.dart';
import '../../../../core/widgets/app_shimmer.dart';
import '../../../domain/entities/recipe_entity.dart';
import '../../bloc/recipes_cubit/recipes_cubit.dart';
import 'recipe_card.dart';

class RecipesGrid extends StatelessWidget {
  final List<RecipeEntity> recipes;
  final bool isLoading;

  const RecipesGrid({super.key, required this.recipes}) : isLoading = false;
  const RecipesGrid.skeleton({super.key, required this.recipes})
    : isLoading = true;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      sliver: SliverGrid(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12.w,
          mainAxisSpacing: 12.h,
          childAspectRatio: 0.64,
        ),
        delegate: SliverChildBuilderDelegate((_, index) {
          if (index == recipes.length - 1 && !isLoading) {
            // Load more recipes when reaching the end of the list
            context.read<RecipesCubit>().load();
          }

          return AppShimmer(
            enabled: isLoading,
            child: RecipeCard(recipes[index], key: ValueKey(recipes[index].id)),
          );
        }, childCount: recipes.length),
      ),
    );
  }
}
