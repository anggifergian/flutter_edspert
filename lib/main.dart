import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:flutter_edspert/configs/environment.dart';
import 'package:flutter_edspert/configs/theme.dart';
import 'package:flutter_edspert/providers/course_provider.dart';
import 'package:flutter_edspert/views/final_project/course/course_list.dart';
import 'package:provider/provider.dart';

Future<void> main(List<String> args) async {
  await dotenv.load(fileName: Environment.fileName);

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: ((context) => CourseProvider())),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: lightTheme(context),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        title: 'Flutter Edspert',
        home: Scaffold(
          backgroundColor: Color.fromARGB(255, 178, 234, 248),
          body: Padding(
            padding: EdgeInsets.all(14.0),
            child: SafeArea(child: CourseList()),
          ),
        ));
  }
}
