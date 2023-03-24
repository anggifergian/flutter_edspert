import 'package:flutter/material.dart';

class OrientationDetailViewComponent extends StatelessWidget {
  const OrientationDetailViewComponent({
    Key? key,
    required this.data,
  }) : super(key: key);

  final int data;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              data.toString(),
              style: const TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
