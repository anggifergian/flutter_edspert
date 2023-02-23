import 'package:flutter_state_notifier/flutter_state_notifier.dart';

class StateCounter extends StateNotifier<int> {
  StateCounter() : super(0);

  void increment() {
    state++;
  }

  void decrement() {
    if (state != 0) {
      state--;
    }
  }
}
