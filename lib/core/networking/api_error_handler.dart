import 'package:dio/dio.dart';

import 'api_error_model.dart';

part 'errors_data.dart';

class ErrorHandler {
  static ApiErrorModel handle(dynamic error) {
    if (error is DioException) return _handleDioException(error);

    if (error is String) return ApiErrorModel(errorMessage: error);

    if (error is Exception) {
      return ApiErrorModel(errorMessage: error.toString().split(':').last);
    }

    if (error is TypeError) {
      return DataSource.parsingError.getFailure();
    }

    return DataSource.defaultError.getFailure();
  }

  static ApiErrorModel _handleDioException(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.cancel:
        return error.type.getFailure();

      case DioExceptionType.badResponse:
      case DioExceptionType.unknown:
      case DioExceptionType.connectionError:
      case DioExceptionType.badCertificate:
        return DataSource.defaultError.getFailure();
    }
  }
}

extension DioErrorExtension on DioExceptionType {
  ApiErrorModel getFailure() {
    try {
      final dataSource = DataSource.values.byName(name);
      return dataSource.getFailure();
    } catch (e) {
      throw Exception('$name is not a valid DataSource enum value.');
    }
  }
}
