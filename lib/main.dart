import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:flutter_edspert/configs/environment.dart';
import 'package:flutter_edspert/views/playground/listener/notifier_listener.dart';
import 'package:flutter_edspert/views/playground/value_notifier/playground_value_notifier.dart';
import 'package:provider/provider.dart';

Future<void> main(List<String> args) async {
  await dotenv.load(fileName: Environment.fileName);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ItemNotifier()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: PlaygroundValueNotifier(),
    );
  }
}
