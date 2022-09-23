import 'dart:convert';

import 'package:dio/dio.dart';

class DioExceptions implements Exception {
  String? message;
  DioExceptions.fromDioError(DioError dioError) {
    switch (dioError.type) {
      case DioErrorType.cancel:
        message = "Request to API server was cancelled";
        break;
      case DioErrorType.connectTimeout:
        message = "Connection timeout";
        break;
      case DioErrorType.receiveTimeout:
        message = "Receive timeout";
        break;
      case DioErrorType.response:
        message = _handleError(
            dioError.response!.statusCode, dioError.response!.data);
        break;
      case DioErrorType.sendTimeout:
        message = "Send timeout in connection";
        break;
      default:
        message = "Something went wrong";
        break;
    }
  }

  String _handleError(int? statusCode, dynamic error) {
    Map<String, dynamic> map = jsonDecode(error);
    switch (statusCode) {
      case 400:
        return 'Bad request';
      case 401:
        return map["msg"];
      case 404:
        return map["msg"];
      case 500:
        return 'Internal server error';
      default:
        return 'Oops something went wrong';
    }
  }

  @override
  String toString() => message!;
}