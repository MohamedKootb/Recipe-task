import 'package:dio/dio.dart';

class ApiRequestModel {
  final String endPoint;
  final Map<String, dynamic>? headers;
  final Map<String, dynamic>? body;
  final Map<String, dynamic>? queries;
  final ResponseType? responseType;

  const ApiRequestModel({
    required this.endPoint,
    this.responseType,
    this.headers,
    this.body,
    this.queries,
  });
}
