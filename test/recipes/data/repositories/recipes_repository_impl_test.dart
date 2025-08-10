import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:recipe_task_flutter/core/models/api_response.dart';
import 'package:recipe_task_flutter/core/models/paginated_list.dart';
import 'package:recipe_task_flutter/core/models/pagination_dto.dart';
import 'package:recipe_task_flutter/core/networking/api_result.dart';
import 'package:recipe_task_flutter/recipes/data/data_sources/recipes_remote_data_source.dart';
import 'package:recipe_task_flutter/recipes/data/models/category.dart';
import 'package:recipe_task_flutter/recipes/data/models/detailed_recipe.dart';
import 'package:recipe_task_flutter/recipes/data/models/recipe.dart';
import 'package:recipe_task_flutter/recipes/data/repositories/recipes_repository_impl.dart';
import 'package:recipe_task_flutter/recipes/domain/entities/category_entity.dart';
import 'package:recipe_task_flutter/recipes/domain/entities/detailed_recipe_entity.dart';
import 'package:recipe_task_flutter/recipes/domain/entities/recipe_entity.dart';

class _MockRemote extends Mock implements RecipesRemoteDataSource {}

void main() {
  late RecipesRemoteDataSource remote;
  late RecipesRepositoryImpl repo;

  setUp(() {
    // Force network as connected to avoid relying on real connectivity.
    connectionCheck = () async => true;
    remote = _MockRemote();
    repo = RecipesRepositoryImpl(remote);
  });

  group('getRecipes', () {
    test('returns SuccessResult with mapped items', () async {
      // Arrange
      final recipe = _getRecipe();
      final page = PaginatedList<Recipe>(
        items: [recipe],
        total: 1,
        hasMore: true,
        pageSize: 20,
        pageNumber: 1,
      );
      when(
        () => remote.fetchRecipes(
          const PaginationDto(pageNumber: 1, pageSize: 20),
        ),
      ).thenAnswer(
        (_) async => ApiResponse<PaginatedList<Recipe>>(true, page, null),
      );

      // Act
      final result = await repo.getRecipes(
        dto: const PaginationDto(pageNumber: 1, pageSize: 20),
      );

      // Assert
      expect(result, isA<SuccessResult<PaginatedList<RecipeEntity>>>());
      final data = (result as SuccessResult<PaginatedList<RecipeEntity>>).data;
      expect(data.items.length, 1);
      expect(data.items.first.name, 'Name');
    });

    test('returns FailureResult on exception', () async {
      // Arrange
      when(
        () => remote.fetchRecipes(
          const PaginationDto(pageNumber: 1, pageSize: 20),
        ),
      ).thenThrow(Exception('network'));

      // Act
      final result = await repo.getRecipes(
        dto: const PaginationDto(pageNumber: 1, pageSize: 20),
      );

      // Assert
      expect(result, isA<FailureResult<PaginatedList<RecipeEntity>>>());
      expect(
        (result as FailureResult<PaginatedList<RecipeEntity>>).errorMessage,
        isNotEmpty,
      );
    });
  });

  group('getCategories', () {
    test('returns SuccessResult list length', () async {
      // Arrange
      when(() => remote.fetchCategories()).thenAnswer(
        (_) async => const ApiResponse<List<Category>>(true, [], null),
      );

      // Act
      final result = await repo.getCategories();

      // Assert
      expect(result, isA<SuccessResult<List<CategoryEntity>>>());
      expect(
        (result as SuccessResult<List<CategoryEntity>>).data,
        isA<List<CategoryEntity>>(),
      );
    });

    test(
      'returns FailureResult when remote throws (api success=false)',
      () async {
        // Arrange
        when(() => remote.fetchCategories()).thenThrow(Exception('API error'));

        // Act
        final result = await repo.getCategories();

        // Assert
        expect(result, isA<FailureResult<List<CategoryEntity>>>());
        expect(
          (result as FailureResult<List<CategoryEntity>>).errorMessage,
          contains('error'),
        );
      },
    );
  });

  group('getRecipeDetails', () {
    test('returns SuccessResult with mapped details', () async {
      // Arrange
      final details = _getDetailedRecipe();
      when(() => remote.fetchRecipeDetails(1)).thenAnswer(
        (_) async => ApiResponse<DetailedRecipe>(true, details, null),
      );

      // Act
      final result = await repo.getRecipeDetails(recipeId: 1);

      // Assert
      expect(result, isA<SuccessResult<DetailedRecipeEntity>>());
      final data = (result as SuccessResult<DetailedRecipeEntity>).data;
      expect(data.steps, isEmpty);
    });

    test('returns FailureResult on exception (api success=false)', () async {
      // Arrange
      when(
        () => remote.fetchRecipeDetails(2),
      ).thenThrow(Exception('API error'));

      // Act
      final result = await repo.getRecipeDetails(recipeId: 2);

      // Assert
      expect(result, isA<FailureResult<DetailedRecipeEntity>>());
      expect(
        (result as FailureResult<DetailedRecipeEntity>).errorMessage,
        contains('error'),
      );
    });
  });
}

Recipe _getRecipe() {
  return const Recipe(
    1,
    'Name',
    'img',
    false,
    null,
    null,
    null,
    null,
    AdditionalInfo(1, 10, null),
  );
}

DetailedRecipe _getDetailedRecipe() {
  return const DetailedRecipe(
    1,
    'Name',
    'img',
    false,
    null,
    null,
    null,
    null,
    AdditionalInfo(1, 10, null),
    ingredients: [],
    steps: [],
  );
}
