import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
          child: Center(
        child: FittedBox(
          fit: BoxFit.fitWidth,
          child: Text('Page Not Found'),
        ),
      )),
    );
  }
}
