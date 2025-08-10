import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../models/api_response.dart';
import 'api_error_handler.dart';

// Allow tests to override how connectivity is checked without altering call sites.
typedef ConnectionCheck = Future<bool> Function();
ConnectionCheck connectionCheck =
    () => InternetConnectionChecker().hasConnection;

sealed class ApiResult<T> {
  /// Handles API calls Exceptions and maps the result.
  static Future<ApiResult<L>> handle<T, L>(
    Future<ApiResponse<T>> Function() apiCall,
    L Function(T) onSuccess,
  ) async {
    try {
      if (!(await connectionCheck())) {
        return FailureResult('No Internet Connection');
      }

      final response = await apiCall();

      if (!response.success || response.data == null) {
        return FailureResult(response.error?.toString() ?? 'Unknown error');
      }

      return SuccessResult(onSuccess(response.data as T));
    } catch (e) {
      return FailureResult(e);
    }
  }
}

class SuccessResult<T> extends ApiResult<T> {
  final T data;

  SuccessResult(this.data);
}

class FailureResult<T> extends ApiResult<T> {
  final String errorMessage;

  FailureResult(dynamic error)
    : errorMessage = ErrorHandler.handle(error).errorMessage;
}
