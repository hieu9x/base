import 'package:base/global/constant/constants.dart';
import 'package:dio/dio.dart';

import '../app/models/general_model.dart';

class DioExceptions implements Exception {
  DioExceptions.fromDioError(DioError dioError) {
    switch (dioError.type) {
      case DioErrorType.cancel:
        throw "Request to API server was cancelled";
      case DioErrorType.connectTimeout:
        throw "Connection timeout with API server";
      case DioErrorType.receiveTimeout:
        throw "Receive timeout in connection with API server";
      case DioErrorType.response:
        throw _handleError(
          dioError.response?.statusCode,
          dioError,
        );
      case DioErrorType.sendTimeout:
        throw "Send timeout in connection with API server";
      case DioErrorType.other:
        if (dioError.message.contains("SocketException")) {
          throw AppConstants.noInterNet;
        }
        throw "Unexpected error occurred";
      default:
        throw "Something went wrong";
    }
  }

  String _handleError(int? statusCode, DioError dioError) {
    switch (statusCode) {
      // case 400:
      //   return 'Bad request';
      // case 401:
      //   return 'Unauthorized';
      // case 403:
      //   return 'Forbidden';
      // case 404:
      //   return error['message'];
      case 500:
        return 'Internal server error';
      case 502:
        return 'Bad gateway';
      default:
        final errorData = GeneralModel.fromJson(dioError.response?.data ?? GeneralModel.error());
        throw errorData.message;
    }
  }
}
