import 'package:flutter_edspert/configs/dio_client.dart';
import 'package:flutter_edspert/models/final_project_app/course.dart';

class CourseService {
  final String _userEmail = 'testerngbayu@gmail.com';

  final DioClient dioClient = DioClient();

  Future<List<Course>?> getAll({String major = 'IPA'}) async {
    var path = '/exercise/data_course?major_name=$major&user_email=$_userEmail';
    var response = await dioClient.dio.get(path);

    if (response.statusCode == 200) {
      return CourseListResponse.fromJson(response.data).data;
    } else {
      throw 'Unable to retrieve course data.';
    }
  }
}
