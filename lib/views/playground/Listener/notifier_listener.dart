import 'dart:collection';

import 'package:flutter/material.dart';

class ItemNotifier extends ChangeNotifier {
  final List<String> _items = [];
  int _size = 0;

  List<String> getItems() => UnmodifiableListView(_items);

  int getSize() => _size;

  void addItem(String value) {
    _items.add(value);
    _size++;
    notifyListeners();
  }

  void removeItem(int index) {
    debugPrint('removing item...');
    if (_items.isNotEmpty) {
      debugPrint('remove item');
      _items.removeAt(index);
      _size--;
      notifyListeners();
    }
  }

  void modifyItem(int index, String data) {
    _items[index] = data;
    notifyListeners();
  }
}
