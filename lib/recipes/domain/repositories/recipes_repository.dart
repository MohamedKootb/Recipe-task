import '../../../core/models/paginated_list.dart';
import '../../../core/models/pagination_dto.dart';
import '../../../core/networking/api_result.dart';
import '../entities/category_entity.dart';
import '../entities/detailed_recipe_entity.dart';
import '../entities/recipe_entity.dart';

abstract class RecipesRepository {
  Future<ApiResult<List<CategoryEntity>>> getCategories();

  Future<ApiResult<PaginatedList<RecipeEntity>>> getRecipes({
    required PaginationDto dto,
  });

  Future<ApiResult<DetailedRecipeEntity>> getRecipeDetails({
    required int recipeId,
  });
}
