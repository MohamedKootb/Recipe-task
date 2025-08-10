import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/networking/api_result.dart';
import '../../../domain/entities/category_entity.dart';
import '../../../domain/use_cases/get_categories.dart';

part 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  final GetCategoriesUseCase _getCategories;
  CategoriesCubit(this._getCategories) : super(const CategoriesInitial());

  Future<void> load() async {
    emit(const CategoriesLoading());

    final response = await _getCategories();
    switch (response) {
      case SuccessResult():
        emit(CategoriesLoaded(response.data));
      case FailureResult():
        emit(CategoriesError(response.errorMessage));
    }
  }
}
