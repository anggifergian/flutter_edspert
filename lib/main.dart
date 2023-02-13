import 'package:flutter/cupertino.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';

import 'package:flutter_edspert/configs/environment.dart';
import 'package:flutter_edspert/configs/theme/cupertino_light_theme.dart';
import 'package:flutter_edspert/views/tutorial_getx/page_five.dart';
import 'package:flutter_edspert/views/tutorial_getx/page_four.dart';
import 'package:flutter_edspert/views/tutorial_getx/page_one.dart';
import 'package:flutter_edspert/views/tutorial_getx/page_three.dart';
import 'package:flutter_edspert/views/tutorial_getx/page_two.dart';

Future<void> main(List<String> args) async {
  await dotenv.load(fileName: Environment.fileName);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetCupertinoApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Edspert',
      theme: cupertinoLight,
      home: const PageOne(),
      getPages: [
        GetPage(name: '/page-two', page: () => const PageTwo()),
        GetPage(name: '/page-three', page: () => const PageThree()),
        GetPage(name: '/page-four/:id', page: () => const PageFour()),
        GetPage(name: '/page-five', page: () => const PageFive()),
      ],
    );
  }
}
