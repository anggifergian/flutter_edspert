import 'package:flutter/material.dart';

class LinearProgress extends StatelessWidget {
  final double value;
  final double height;

  const LinearProgress({super.key, this.value = 0, this.height = 8});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: height,
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          child: LinearProgressIndicator(
            value: value,
            backgroundColor: const Color(0xFFF0F0F0),
          ),
        ));
  }
}
