import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/networking/api_result.dart';
import '../../../domain/entities/recipe_entity.dart';
import '../../../domain/use_cases/get_recipes.dart';

part 'recipes_state.dart';

class RecipesCubit extends Cubit<RecipesState> {
  final GetRecipesUseCase _getRecipes;
  RecipesCubit(this._getRecipes) : super(const RecipesInitial());

  Future<void> load({bool refresh = false}) async {
    if (!refresh) {
      // Prevent duplicate requests and
      if (_getRecipes.isLoading) return;

      // stop when no more pages
      if (!_getRecipes.hasMore && _getRecipes.items.isNotEmpty) return;
    }

    emit(RecipesLoading(isLoadMore: !refresh && _getRecipes.items.isNotEmpty));

    final response = await _getRecipes.loadNext(refresh: refresh);

    switch (response) {
      case SuccessResult(:final data):
        emit(RecipesLoaded(recipes: data, hasMore: _getRecipes.hasMore));
      case FailureResult():
        emit(RecipesError(response.errorMessage));
    }
  }
}
