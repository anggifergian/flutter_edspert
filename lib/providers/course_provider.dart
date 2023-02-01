import 'package:flutter/foundation.dart';
import 'package:flutter_edspert/models/final_project_app/course.dart';

import 'package:flutter_edspert/services/final_project/course_service.dart';

class CourseProvider with ChangeNotifier {
  bool isLoading = false;

  List<Course>? data;

  void getAll({int item = 1}) async {
    isLoading = true;
    notifyListeners();

    var response = await CourseService().getAll();
    print(response);

    await Future.delayed(const Duration(seconds: 3));
    isLoading = false;
    notifyListeners();
  }
}
