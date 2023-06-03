import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../global/environment.dart';
import 'dio_exception.dart';

class HttpAuth {
  final Dio dio = Dio(
    BaseOptions(
      connectTimeout: 30000,
      baseUrl: Environment.authUrl,
      responseType: ResponseType.json,
      contentType: ContentType.json.toString(),
    ),
  )
    ..interceptors.add(
      PrettyDioLogger(
          requestHeader: false,
          requestBody: false,
          responseBody: false,
          responseHeader: false,
          error: true,
          compact: true,
          maxWidth: 90),
    )
    ..interceptors.add(
      DioCacheInterceptor(
        options: CacheOptions(
          store: MemCacheStore(),
          maxStale: const Duration(days: 30),
        ),
      ),
    );

  Future<dynamic> fetchData(String path, {Map<String, String>? params}) async {
    try {
      final response = await dio.get(path, queryParameters: params);
      return response.data;
    } on DioError catch (e) {
      DioExceptions.fromDioError(e);
    }
  }

  Future<dynamic> postData(String path, dynamic body, {Map<String, String>? headerData}) async {
    headerData = headerData ?? {};
    try {
      final response = await dio.post(path, data: body, options: Options(headers: headerData));
      return response.data;
    } on DioError catch (e) {
      DioExceptions.fromDioError(e);
    }
  }

  Future<dynamic> delete(String path, dynamic body, {Map<String, String>? headerData}) async {
    headerData = headerData ?? {};
    try {
      final response = await dio.delete(path, data: body, options: Options(headers: headerData));
      return response.data;
    } on DioError catch (e) {
      DioExceptions.fromDioError(e);
    }
  }

  void setBaseUrl(String baseUrl) {
    dio.options.baseUrl = baseUrl;
  }
}
