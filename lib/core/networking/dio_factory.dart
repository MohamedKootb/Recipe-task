import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'api_constants.dart';

class DioFactory {
  const DioFactory._();

  static Dio? _dio;
  static Dio get instance {
    if (_dio != null) return _dio!;

    _dio =
        Dio()
          ..options.baseUrl = ApiConstants.baseUrl
          ..options.connectTimeout = const Duration(seconds: 90)
          ..options.receiveTimeout = const Duration(seconds: 90)
          ..interceptors.addAll([
            if (!kReleaseMode)
              PrettyDioLogger(
                requestBody: true,
                requestHeader: true,
                responseHeader: true,
                responseBody: true,
                error: true,
              ),
          ]);

    return _dio!;
  }
}
