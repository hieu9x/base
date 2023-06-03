import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../global/environment.dart';
import 'dio_exception.dart';

class HttpBase {
  Dio dio = Dio(
    BaseOptions(
      connectTimeout: 30000,
      baseUrl: Environment.baseUrl,
      responseType: ResponseType.json,
      contentType: ContentType.json.toString(),
    ),
  )
    ..interceptors.add(
      PrettyDioLogger(
        requestHeader: false,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: false,
        maxWidth: 120,
      ),
    )
    ..interceptors.add(
      DioCacheInterceptor(
        options: CacheOptions(
          store: MemCacheStore(),
          maxStale: const Duration(days: 30),
        ),
      ),
    );

  void setBearerToken(String token) {
    dio.options.headers['Authorization'] = 'Bearer $token';
    dio.options.headers['callMethod'] = "DOCTOR_AVAILABILITY";
  }

  void setBaseUrl(String baseUrl) {
    dio.options.baseUrl = baseUrl;
  }

  void addToClientHeader(Map<String, String> data) {
    dio.options.headers[data.keys.first] = data.values.first;
  }

  Future<dynamic> fetchData(String path, {Map<String, String>? params}) async {
    try {
      final response = await dio.get(path, queryParameters: params);
      return response.data;
    } on DioError catch (e) {
      DioExceptions.fromDioError(e);
    }
  }

  Future<dynamic> postData(String path, dynamic body) async {
    try {
      final response = await dio.post(path, data: body);
      return response.data;
    } on DioError catch (e) {
      DioExceptions.fromDioError(e);
    }
  }

  Future<dynamic> putData(String path, dynamic body) async {
    try {
      final response = await dio.put(path, data: body);
      return response.data;
    } on DioError catch (e) {
      DioExceptions.fromDioError(e);
    }
  }

  Future<dynamic> patchData(String path, dynamic body) async {
    try {
      final response = await dio.patch(path, data: body);
      return response.data;
    } on DioError catch (e) {
      DioExceptions.fromDioError(e);
    }
  }

  Future<dynamic> requestData(String path, {dynamic body}) async {
    try {
      final response = await dio.request(path, queryParameters: body, options: Options(method: "GET"));
      return response.data;
    } on DioError catch (e) {
      DioExceptions.fromDioError(e);
    }
  }

  Future<dynamic> deleteData(String path, {dynamic body}) async {
    try {
      final response = await dio.delete(path, data: body);
      return response.data;
    } on DioError catch (e) {
      DioExceptions.fromDioError(e);
    }
  }
}
