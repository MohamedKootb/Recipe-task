class ApiErrorModel {
  final String errorMessage;
  final int? code;

  const ApiErrorModel({this.errorMessage = 'Unknown Error', this.code});
}
