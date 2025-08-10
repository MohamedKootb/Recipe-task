import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theming/app_sizer.dart';
import '../../../../core/widgets/retry_tile.dart';
import '../../../domain/entities/recipe_entity.dart';
import '../../bloc/recipes_cubit/recipes_cubit.dart';
import 'recipes_grid.dart';

class RecipesGridBlocBuilder extends StatelessWidget {
  const RecipesGridBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecipesCubit, RecipesState>(
      buildWhen: (_, current) {
        if (current is RecipesLoading && current.isLoadMore) return false;
        return true;
      },
      builder: (context, state) {
        return SliverPadding(
          padding: EdgeInsets.symmetric(vertical: 16.h),
          sliver: switch (state) {
            RecipesLoading() => RecipesGrid.skeleton(
              recipes: List.generate(6, (i) => RecipeEntity.mock),
            ),
            RecipesLoaded() => RecipesGrid(recipes: state.recipes),
            RecipesError() => SliverToBoxAdapter(
              child: RetryTile(
                errorMessage: state.errorMessage,
                retryMethod: () => context.read<RecipesCubit>().load(),
              ),
            ),
            _ => const SliverToBoxAdapter(child: SizedBox.shrink()),
          },
        );
      },
    );
  }
}
