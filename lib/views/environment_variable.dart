import 'package:flutter/material.dart';
import 'package:flutter_edspert/configs/environment.dart';

class EnvironmentVariable extends StatelessWidget {
  const EnvironmentVariable({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(Environment.apiUrl),
      ),
    );
  }
}
