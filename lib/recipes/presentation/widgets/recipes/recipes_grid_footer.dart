import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theming/app_sizer.dart';
import '../../../domain/entities/recipe_entity.dart';
import '../../bloc/recipes_cubit/recipes_cubit.dart';
import 'recipes_grid.dart';

class RecipesGridFooter extends StatelessWidget {
  const RecipesGridFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecipesCubit, RecipesState>(
      builder: (context, state) {
        return switch (state) {
          RecipesLoading(isLoadMore: true) => RecipesGrid.skeleton(
            recipes: List.generate(6, (i) => RecipeEntity.mock),
          ),

          RecipesLoaded(hasMore: false) => SliverToBoxAdapter(
            child: SizedBox(height: 24.h),
          ),

          _ => const SliverToBoxAdapter(child: SizedBox.shrink()),
        };
      },
    );
  }
}
