import 'package:get_it/get_it.dart';

import '../../recipes/data/data_sources/recipes_remote_data_source.dart';
import '../../recipes/data/repositories/recipes_repository_impl.dart';
import '../../recipes/domain/repositories/recipes_repository.dart';
import '../../recipes/domain/use_cases/get_categories.dart';
import '../../recipes/domain/use_cases/get_recipe_details.dart';
import '../../recipes/domain/use_cases/get_recipes.dart';
import '../networking/dio_factory.dart';
import '../networking/dio_helper.dart';

final getIt = GetIt.instance;

void setupDependencies() {
  // Core
  getIt.registerLazySingleton(() => DioHelper(DioFactory.instance));

  // Recipes
  getIt.registerLazySingleton<RecipesRemoteDataSource>(
    () => RecipesRemoteDataSourceImpl(getIt()),
  );
  getIt.registerLazySingleton<RecipesRepository>(
    () => RecipesRepositoryImpl(getIt()),
  );
  getIt.registerLazySingleton(() => GetRecipesUseCase(getIt()));
  getIt.registerLazySingleton(() => GetCategoriesUseCase(getIt()));
  getIt.registerLazySingleton(() => GetRecipeDetailsUseCase(getIt()));
}
