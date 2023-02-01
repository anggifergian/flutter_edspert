import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_edspert/configs/environment.dart';

class DioClient {
  late Dio _dio;

  DioClient() {
    final options = BaseOptions(
        baseUrl: Environment.edspertApi,
        headers: {
          'x-api-key': Environment.edspertKey,
          HttpHeaders.contentTypeHeader: 'application/json',
        },
        responseType: ResponseType.json);

    _dio = Dio(options);
  }

  Future get(String url, Map<String, dynamic> queryParams) async {
    try {
      final response = await _dio.get(url, queryParameters: queryParams);

      return response.data;
    } on DioError catch (e) {
      if (e.response?.data != null) throw Exception(e.response?.data);

      throw Exception(e.message);
    }
  }
}
