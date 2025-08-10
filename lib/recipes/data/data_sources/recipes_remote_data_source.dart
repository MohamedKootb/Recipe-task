import '../../../core/models/api_response.dart';
import '../../../core/models/paginated_list.dart';
import '../../../core/models/pagination_dto.dart';
import '../../../core/networking/api_constants.dart';
import '../../../core/networking/api_request_model.dart';
import '../../../core/networking/dio_helper.dart';
import '../models/category.dart';
import '../models/detailed_recipe.dart';
import '../models/recipe.dart';

abstract class RecipesRemoteDataSource {
  Future<ApiResponse<List<Category>>> fetchCategories();
  Future<ApiResponse<PaginatedList<Recipe>>> fetchRecipes(PaginationDto dto);
  Future<ApiResponse<DetailedRecipe>> fetchRecipeDetails(int recipeId);
}

class RecipesRemoteDataSourceImpl implements RecipesRemoteDataSource {
  final DioHelper _dioHelper;
  const RecipesRemoteDataSourceImpl(this._dioHelper);

  @override
  Future<ApiResponse<List<Category>>> fetchCategories() async {
    final response = await _dioHelper.getData(
      const ApiRequestModel(endPoint: ApiConstants.getCategoriesEP),
    );

    return ApiResponse.fromJson(
      response.data,
      (json) => (json as List? ?? []).map((e) => Category.fromJson(e)).toList(),
    );
  }

  @override
  Future<ApiResponse<PaginatedList<Recipe>>> fetchRecipes(
    PaginationDto dto,
  ) async {
    final response = await _dioHelper.getData(
      ApiRequestModel(
        endPoint: ApiConstants.getRecipesEP,
        queries: dto.toJson(),
      ),
    );

    return ApiResponse.fromJson(
      response.data,
      (json) => PaginatedList.fromJson(
        json as Map<String, dynamic>,
        (item) => Recipe.fromJson(item),
      ),
    );
  }

  @override
  Future<ApiResponse<DetailedRecipe>> fetchRecipeDetails(int recipeId) async {
    final response = await _dioHelper.getData(
      ApiRequestModel(
        endPoint: ApiConstants.getRecipeDetailsEP,
        queries: {'id': recipeId},
      ),
    );

    return ApiResponse.fromJson(
      response.data as Map<String, dynamic>,
      (json) => DetailedRecipe.fromJson(json),
    );
  }
}
