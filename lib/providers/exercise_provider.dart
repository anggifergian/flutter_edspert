import 'package:flutter/foundation.dart';

import 'package:flutter_edspert/models/final_project_app/exercise.dart';
import 'package:flutter_edspert/services/final_project/course_service.dart';

class ExerciseProvider with ChangeNotifier {
  bool isLoading = false;
  bool isEmpty = false;
  List<Exercise>? exercises = [];

  getAll(String courseId) async {
    isLoading = true;
    notifyListeners();

    try {
      var response = await CourseService().getExercises(courseId);

      if (response == null) {
        exercises = [];
        isEmpty = true;
        isLoading = false;
        notifyListeners();
      }

      if (response != null) {
        exercises = response;
        isEmpty = false;
        isLoading = false;
        notifyListeners();
      }
    } catch (err) {
      isLoading = false;
      notifyListeners();
    }
  }
}
