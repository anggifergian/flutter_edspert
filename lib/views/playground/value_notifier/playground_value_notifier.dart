import 'package:flutter/material.dart';
import 'package:flutter_edspert/views/playground/value_notifier/counter_notifier.dart';

class PlaygroundValueNotifier extends StatelessWidget {
  const PlaygroundValueNotifier({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var counter = CounterNotifier();

    return ValueListenableBuilder(
        valueListenable: counter,
        builder: (context, value, child) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Value Notifier'),
              elevation: 0,
            ),
            floatingActionButton: Row(
              children: [
                FloatingActionButton(
                  onPressed: () => counter.increment(),
                  child: const Icon(Icons.add, color: Colors.white),
                ),
                if (value != 0) ...[
                  FloatingActionButton(
                    onPressed: () => counter.decrement(),
                    child: const Icon(Icons.remove, color: Colors.white),
                  )
                ],
              ],
            ),
            body: Padding(
              padding: const EdgeInsets.all(20),
              child: Text('$value'),
            ),
          );
        });
  }
}
