import 'dart:io';
import 'package:dio/dio.dart';

import 'package:flutter_edspert/configs/environment.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioClient {
  Dio get dio => _dio();

  Dio _dio() {
    final options = BaseOptions(
        baseUrl: Environment.edspertApi,
        headers: {
          'x-api-key': Environment.edspertKey,
          HttpHeaders.contentTypeHeader: 'application/json',
        },
        responseType: ResponseType.json);

    var dio = Dio(options);

    dio.interceptors.add(PrettyDioLogger(
      compact: true,
    ));

    return dio;
  }
}
