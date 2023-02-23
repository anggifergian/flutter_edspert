import 'package:flutter/material.dart';

import 'package:flutter_edspert/views/playground/state_notifier/state_notifier.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';

class PlaygroundStateNotifier extends StatelessWidget {
  const PlaygroundStateNotifier({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final myCounter = StateCounter();

    return Scaffold(
      appBar: AppBar(
        title: const Text('State Notifier'),
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => myCounter.increment(),
        child: const Icon(Icons.add),
      ),
      body: StateNotifierBuilder(
        stateNotifier: myCounter,
        builder: (context, value, child) => Padding(
          padding: const EdgeInsets.all(10),
          child: Text(value.toString()),
        ),
      ),
    );
  }
}
