import 'package:dio/dio.dart';

import 'api_request_model.dart';

class DioHelper {
  final Dio _dio;
  const DioHelper(this._dio);

  Future<Response> getData(ApiRequestModel model) async {
    final response = await _dio.get(
      model.endPoint,
      queryParameters: model.queries,
      options: Options(
        headers: model.headers,
        responseType: model.responseType,
      ),
    );

    return response;
  }
}
