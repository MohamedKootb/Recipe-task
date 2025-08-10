part of 'api_error_handler.dart';

// DO NOT edit enum DataSource values without as it's based DioExceptionType values
enum DataSource {
  noContent,
  badRequest,
  unAuthorized,
  forbidden,
  internalServerError,
  notFound,
  apiLogicError,
  serverFailure,
  badGateway,

  connectionTimeout,
  cancel,
  receiveTimeout,
  sendTimeout,
  cacheError,
  noInternetConnection,
  parsingError,

  defaultError,
}

extension DataSourceExtension on DataSource {
  ApiErrorModel getFailure() => _errorsData[this]!;
}

final _errorsData = <DataSource, ApiErrorModel>{
  DataSource.noContent: const ApiErrorModel(
    code: 201,
    errorMessage: 'No content',
  ),
  DataSource.badRequest: const ApiErrorModel(
    code: 400,
    errorMessage: 'Bad request',
  ),

  DataSource.unAuthorized: const ApiErrorModel(
    code: 401,
    errorMessage: 'Unauthorized',
  ),

  DataSource.forbidden: const ApiErrorModel(
    code: 403,
    errorMessage: 'Forbidden',
  ),
  DataSource.notFound: const ApiErrorModel(
    code: 404,
    errorMessage: 'Not found',
  ),

  DataSource.internalServerError: const ApiErrorModel(
    code: 500,
    errorMessage: 'Internal server error',
  ),
  DataSource.serverFailure: const ApiErrorModel(
    code: 502,
    errorMessage: 'Server failure',
  ),
  DataSource.badGateway: const ApiErrorModel(
    code: 503,
    errorMessage: 'Service unavailable',
  ),

  DataSource.apiLogicError: const ApiErrorModel(
    code: 422,
    errorMessage: 'API logic error',
  ),

  DataSource.connectionTimeout: const ApiErrorModel(
    code: -1,
    errorMessage: 'Connection timeout',
  ),

  DataSource.cancel: const ApiErrorModel(code: -2, errorMessage: 'Cancel'),

  DataSource.receiveTimeout: const ApiErrorModel(
    code: -3,
    errorMessage: 'Receive timeout',
  ),

  DataSource.sendTimeout: const ApiErrorModel(
    code: -4,
    errorMessage: 'Send timeout',
  ),

  DataSource.cacheError: const ApiErrorModel(
    code: -5,
    errorMessage: 'Cache error',
  ),

  DataSource.noInternetConnection: const ApiErrorModel(
    code: -6,
    errorMessage: 'No internet connection',
  ),
  DataSource.parsingError: const ApiErrorModel(
    code: -7,
    errorMessage: 'Parsing error',
  ),

  DataSource.defaultError: const ApiErrorModel(
    code: -8,
    errorMessage: 'Something went wrong',
  ),

  // Add your custom errors here
};
