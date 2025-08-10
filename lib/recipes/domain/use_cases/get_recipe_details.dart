import '../../../core/networking/api_result.dart';
import '../entities/detailed_recipe_entity.dart';
import '../repositories/recipes_repository.dart';

class GetRecipeDetailsUseCase {
  final RecipesRepository _repo;
  const GetRecipeDetailsUseCase(this._repo);

  Future<ApiResult<DetailedRecipeEntity>> call(int recipeId) {
    return _repo.getRecipeDetails(recipeId: recipeId);
  }
}
