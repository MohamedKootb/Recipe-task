import '../../../core/models/paginated_list.dart';
import '../../../core/models/pagination_dto.dart';
import '../../../core/networking/api_result.dart';
import '../../../core/shared/pagination_mixin.dart';
import '../entities/recipe_entity.dart';
import '../repositories/recipes_repository.dart';

class GetRecipesUseCase with PaginationMixin<RecipeEntity> {
  final RecipesRepository _repo;
  GetRecipesUseCase(this._repo);

  @override
  Future<ApiResult<PaginatedList<RecipeEntity>>> call(PaginationDto dto) {
    return _repo.getRecipes(dto: dto);
  }
}
