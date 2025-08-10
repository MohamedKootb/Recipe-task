part of 'recipe_details_cubit.dart';

sealed class RecipeDetailsState {
  const RecipeDetailsState();
}

class RecipeDetailsInitial extends RecipeDetailsState {
  const RecipeDetailsInitial();
}

class RecipeDetailsLoading extends RecipeDetailsState {
  const RecipeDetailsLoading();
}

class RecipeDetailsLoaded extends RecipeDetailsState {
  final DetailedRecipeEntity details;
  const RecipeDetailsLoaded(this.details);
}

class RecipeDetailsError extends RecipeDetailsState {
  final String message;
  const RecipeDetailsError(this.message);
}
