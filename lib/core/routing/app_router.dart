import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../recipes/presentation/bloc/categories_cubit/categories_cubit.dart';
import '../../recipes/presentation/bloc/recipe_details_cubit/recipe_details_cubit.dart';
import '../../recipes/presentation/bloc/recipes_cubit/recipes_cubit.dart';
import '../../recipes/presentation/screens/recipe_details_screen.dart';
import '../../recipes/presentation/screens/recipes_screen.dart';
import '../di/di.dart';
import 'app_routes.dart';

class AppRouter {
  const AppRouter._();

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    final arg = settings.arguments;

    final screen = switch (settings.name) {
      AppRoutes.home => MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => RecipesCubit(getIt())..load()),
          BlocProvider(create: (_) => CategoriesCubit(getIt())..load()),
        ],
        child: const RecipesScreen(),
      ),

      AppRoutes.recipeDetails => BlocProvider(
        create: (_) => RecipeDetailsCubit(getIt())..load(arg),
        child: RecipeDetailsScreen(recipeId: arg as int),
      ),

      _ => Scaffold(
        body: Center(child: Text('No route defined for ${settings.name}')),
      ),
    };

    return MaterialPageRoute(settings: settings, builder: (_) => screen);
  }
}
