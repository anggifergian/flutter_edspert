import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import 'package:flutter_edspert/configs/environment.dart';
import 'package:flutter_edspert/models/final_project_app/course.dart';

class CourseService {
  final String _userEmail = 'testerngbayu@gmail.com';
  final String _xApiKey = '18be70c0-4e4d-44ff-a475-50c51ece99a0';

  Future<List<Course>> getAll({String major = 'IPA'}) async {
    try {
      print('start...');
      final uri = Uri.parse('${Environment.edspertApi}/exercise/data_course?major_name=$major&user_email=$_userEmail');
      final response = await http.get(uri, headers: {'x-api-key': _xApiKey});

      print('finish...');
      switch (response.statusCode) {
        case 200:
          final data = jsonDecode(response.body);
          return CourseListResponse.fromJson(data).data!;
        default:
          print('error...${response.reasonPhrase}');
          throw Exception(response.reasonPhrase);
      }
    } on SocketException catch (_) {
      rethrow;
    }
  }
}
