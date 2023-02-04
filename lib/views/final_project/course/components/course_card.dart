import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter_edspert/models/final_project_app/course.dart';

class CourseCard extends StatelessWidget {
  final Course? course;

  const CourseCard({super.key, this.course});

  double getPercent() {
    if (course == null) {
      return 0;
    }

    var count = course!.jumlahDone / course!.jumlahMateri;
    debugPrint("${course?.courseName}: $count");

    if (count.isNaN) {
      return 0;
    }

    return double.parse(count.toStringAsFixed(2));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => print("Hello World..."),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10)), color: Colors.white),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _buildCourseIcon(),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [_buildCourseName(), _buildCourseCompletion(), _buildCourseProgressBar()],
              ),
            )
          ],
        ),
      ),
    );
  }

  Container _buildCourseIcon() {
    return Container(
      width: 70,
      height: 70,
      margin: const EdgeInsets.only(right: 14),
      padding: const EdgeInsets.all(14),
      decoration: const BoxDecoration(color: Color(0xFFF3F7F8), borderRadius: BorderRadius.all(Radius.circular(14))),
      child: CachedNetworkImage(
        imageUrl: course!.urlCover,
        fit: BoxFit.contain,
        errorWidget: (context, url, error) => const Icon(Icons.error),
      ),
    );
  }

  Widget _buildCourseName() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 2),
      child: Text(
        "${course?.courseName}",
        style: GoogleFonts.poppins(
          height: 1.3,
          fontWeight: FontWeight.w700,
          fontSize: 16,
          color: Colors.black87,
        ),
      ),
    );
  }

  Widget _buildCourseCompletion() {
    return Text(
      "${course?.jumlahDone}/${course?.jumlahMateri} Paket latihan soal",
      style: GoogleFonts.poppins(fontSize: 14, color: Colors.black54),
    );
  }

  Widget _buildCourseProgressBar() {
    return Container(
        margin: const EdgeInsets.only(top: 12),
        height: 8,
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          child: LinearProgressIndicator(
            value: getPercent(),
            backgroundColor: const Color(0xFFF0F0F0),
          ),
        ));
  }
}
