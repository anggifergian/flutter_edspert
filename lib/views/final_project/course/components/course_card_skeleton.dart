import 'package:flutter/material.dart';
import 'package:flutter_edspert/components/skeleton.dart';
import 'package:flutter_edspert/configs/constant.dart';

class CourseCardSkeleton extends StatelessWidget {
  const CourseCardSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: BoxDecoration(
          border: Border.all(width: 0.3, style: BorderStyle.solid, color: secondaryColor10LightTheme),
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(10))),
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.only(right: 14),
            child: const Skeleton(
              height: 70,
              width: 70,
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Skeleton(
                  height: 10,
                  width: 80,
                ),
                const SizedBox(
                  height: 10,
                ),
                const Skeleton(
                  height: 10,
                  width: 120,
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: const Skeleton(
                    height: 10,
                    radius: 30,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
