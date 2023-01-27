import 'package:flutter/material.dart';
import 'package:flutter_edspert/components/skeleton.dart';
import 'package:flutter_edspert/configs/constant.dart';

class ExerciseCardSkeleton extends StatelessWidget {
  const ExerciseCardSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(14),
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
            border: Border.all(
                width: 0.3,
                style: BorderStyle.solid,
                color: secondaryColor10LightTheme),
            color: Colors.white,
            borderRadius: const BorderRadius.all(Radius.circular(10))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Skeleton(
              height: 50,
              width: 50,
              radius: 12,
            ),
            SizedBox(
              height: defaultPadding,
            ),
            Skeleton(
              height: 12,
            ),
            SizedBox(
              height: 6,
            ),
            Skeleton(
              width: 80,
              height: 12,
            ),
          ],
        ));
  }
}
