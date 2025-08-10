import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/networking/api_result.dart';
import '../../../domain/entities/detailed_recipe_entity.dart';
import '../../../domain/use_cases/get_recipe_details.dart';

part 'recipe_details_state.dart';

class RecipeDetailsCubit extends Cubit<RecipeDetailsState> {
  final GetRecipeDetailsUseCase _getRecipeDetails;
  RecipeDetailsCubit(this._getRecipeDetails)
    : super(const RecipeDetailsInitial());

  Future<void> load(int id) async {
    emit(const RecipeDetailsLoading());

    final response = await _getRecipeDetails(id);

    switch (response) {
      case SuccessResult():
        emit(RecipeDetailsLoaded(response.data));
      case FailureResult():
        emit(RecipeDetailsError(response.errorMessage));
    }
  }
}
