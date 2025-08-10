import '../../../core/networking/api_result.dart';
import '../entities/category_entity.dart';
import '../repositories/recipes_repository.dart';

class GetCategoriesUseCase {
  final RecipesRepository _repo;
  const GetCategoriesUseCase(this._repo);

  Future<ApiResult<List<CategoryEntity>>> call() => _repo.getCategories();
}
