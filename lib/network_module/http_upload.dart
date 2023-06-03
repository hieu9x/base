import 'dart:io';

import 'package:dio/dio.dart';

import '../global/environment.dart';
import 'dio_exception.dart';

class HttpUpload {
  Future<dynamic> uploadImage(String token, File file) async {
    try {
      String fileName = file.path.split('/').last;
      FormData data = FormData.fromMap({
        "files": await MultipartFile.fromFile(
          file.path,
          filename: fileName,
        ),
      });
      final Dio dio = Dio(
        BaseOptions(
          baseUrl: Environment.authUrl,
          responseType: ResponseType.json,
          headers: {
            "Authorization": "Bearer $token",
            "channel": "student",
            "type": "file",
            "Content-Disposition": "form-data",
          },
        ),
      );
      final response = await dio.post("", data: data);
      return response.data;
    } on DioError catch (e) {
      DioExceptions.fromDioError(e);
    }
  }
}
