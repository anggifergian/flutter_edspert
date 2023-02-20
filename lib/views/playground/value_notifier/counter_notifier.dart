import 'package:flutter/material.dart';

class CounterNotifier extends ValueNotifier {
  CounterNotifier({int? value}) : super(value ?? 0);

  void increment() {
    value++;
    notifyListeners();
  }

  void decrement() {
    if (value != 0) {
      value--;
      notifyListeners();
    }
  }
}
