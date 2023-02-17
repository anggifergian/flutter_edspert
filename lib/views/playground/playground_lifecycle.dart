import 'package:flutter/material.dart';

class PlaygroundLifeCycle extends StatefulWidget {
  const PlaygroundLifeCycle({super.key});

  @override
  State<PlaygroundLifeCycle> createState() => _PlaygroundLifeCycleState();
}

class _PlaygroundLifeCycleState extends State<PlaygroundLifeCycle> {
  int counter = 0;

  @override
  void initState() {
    super.initState();
    debugPrint('initState()');
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('build()');
    return Scaffold(
      body: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Counter $counter",
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    debugPrint('setState() $context');
                    setState(() {
                      counter += 1;
                    });
                  },
                  child: const Text('Add'),
                ),
                ElevatedButton(
                  onPressed: () {
                    debugPrint('setState() $context');
                    setState(() {
                      if (counter == 0) {
                        return;
                      }
                      counter -= 1;
                    });
                  },
                  child: const Text('Remove'),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
