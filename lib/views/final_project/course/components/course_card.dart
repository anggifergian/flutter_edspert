import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter_edspert/models/final_project_app/course.dart';

class CourseCard extends StatelessWidget {
  final Course? course;

  const CourseCard({super.key, this.course});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => print("Hello World..."),
      child: Container(
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: Colors.white),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(14),
              decoration: const BoxDecoration(
                  color: Color(0xFFF3F7F8),
                  borderRadius: BorderRadius.all(Radius.circular(14))),
              child: CachedNetworkImage(
                imageUrl: course!.urlCover,
                fit: BoxFit.contain,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
