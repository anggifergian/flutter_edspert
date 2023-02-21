import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/todo_model.dart';

class TodosNotifier extends StateNotifier<List<Todo>> {
  TodosNotifier() : super([]);

  void addTodo(Todo todo) {
    // State in StateNotifier is immutable, we are not allowed to do `state.add(todo)`.
    // Instead, we should create a new list of todos which contains the previous
    // items and the new one.
    // Using Dart's spread operator here is helpful!
    state = [...state, todo];
    // No need to call "notifyListeners" or anything similar. Calling "state ="
    // will automatically rebuild the UI when necessary.
  }

  void removeTodo(String todoID) {
    // Need to refactor remove item from Todos with built-in method
    // from List in flutter.
    state = [
      for (final todo in state)
        if (todo.id != todoID) todo
    ];
  }

  void modifyTodo(String todoID, String description) {
    state = [
      for (final todo in state)
        if (todo.id == todoID) todo.copyWith(description: description) else todo
    ];
  }

  void toggle(String todoID) {
    state = [
      for (final todo in state)
        if (todo.id == todoID) todo.copyWith(completed: !todo.completed) else todo
    ];
  }
}

// We are using StateNotifierProvider to allow the UI to interact with
// our TodoNotifier class.
final todosProvider = StateNotifierProvider<TodosNotifier, List<Todo>>((ref) {
  return TodosNotifier();
});
