class Course {
  String courseId;
  String majorName;
  String courseCategory;
  String courseName;
  String urlCover;
  int jumlahMateri;
  int jumlahDone;
  int progress;

  Course(
    this.courseId,
    this.majorName,
    this.courseCategory,
    this.courseName,
    this.urlCover,
    this.jumlahMateri,
    this.jumlahDone,
    this.progress,
  );

  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(json['course_id'], json['major_name'], json['course_category'], json['course_name'],
        json['url_cover'], json['jumlah_materi'], json['jumlah_done'], json['progress']);
  }
}

class CourseListResponse {
  int? status;
  String? message;
  List<Course>? data;

  CourseListResponse(this.status, this.message, this.data);

  CourseListResponse.fromJson(Map json) {
    status = json['status'];
    message = json['message'];

    if (json['data'] != null) {
      data = <Course>[];
      json['data'].forEach((item) {
        data!.add(Course.fromJson(item));
      });
    }
  }
}
