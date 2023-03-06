import 'package:flutter/material.dart';

import 'package:flutter_edspert/models/final_project_app/course.dart';
import 'package:flutter_edspert/services/final_project/course_service.dart';

class CourseProvider with ChangeNotifier {
  bool isLoading = false;

  List<Course>? course = [];

  Future<void> getAll({required BuildContext context, int item = 1}) async {
    isLoading = true;
    notifyListeners();

    try {
      var response = await CourseService().getAll();

      if (response != null) {
        isLoading = false;
        course = response;
        notifyListeners();
      }
    } catch (e) {
      isLoading = false;
      notifyListeners();

      showModalBottomSheet(
        context: context,
        builder: (context) => const Padding(
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          child: Text('Error, try again later.'),
        ),
      );
    }
  }
}
