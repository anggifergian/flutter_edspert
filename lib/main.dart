import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';

import 'package:flutter_edspert/configs/environment.dart';
import 'package:flutter_edspert/providers/exercise_provider.dart';
import 'package:flutter_edspert/providers/home_provider.dart';
import 'package:flutter_edspert/providers/course_provider.dart';
import 'package:flutter_edspert/views/final_project/home/home_final_project.dart';

Future<void> main(List<String> args) async {
  await dotenv.load(fileName: Environment.fileName);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CourseProvider()),
        ChangeNotifierProvider(create: (context) => ExerciseProvider()),
        ChangeNotifierProvider(create: (context) => HomeProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: HomeFinalProject());
  }
}
