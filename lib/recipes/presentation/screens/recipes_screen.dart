import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/theming/app_colors.dart';
import '../../../core/theming/app_sizer.dart';
import '../bloc/recipes_cubit/recipes_cubit.dart';
import '../widgets/recipes/recipes_grid_bloc_builder.dart';
import '../widgets/recipes/recipes_grid_footer.dart';
import '../widgets/recipes/recipes_sliver_app_bar.dart';

class RecipesScreen extends StatelessWidget {
  const RecipesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightGray,
      body: RefreshIndicator(
        edgeOffset: 140.h + MediaQuery.paddingOf(context).top,
        color: AppColors.darkGreen,
        onRefresh:
            () async => await context.read<RecipesCubit>().load(refresh: true),
        child: const CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
            RecipesSliverAppBar(),
            RecipesGridBlocBuilder(),
            RecipesGridFooter(),
          ],
        ),
      ),
    );
  }
}
