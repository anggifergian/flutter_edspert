import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_edspert/views/playground/riverpod_state_notifier/controllers/todos_notifier.dart';
import 'package:flutter_edspert/views/playground/riverpod_state_notifier/views/todo_add_view.dart';
import 'package:flutter_edspert/views/playground/riverpod_state_notifier/views/todo_edit_view.dart';

class TodoListView extends ConsumerWidget {
  const TodoListView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var todos = ref.watch(todosProvider);

    void handleAddItem() {
      var route = MaterialPageRoute(builder: (context) => const TodoAddView());
      Navigator.of(context).push(route);
    }

    void handleChangeItem(String todoID) {
      var route = MaterialPageRoute(builder: (context) => TodoEditView(todoID: todoID));
      Navigator.of(context).push(route);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo List'),
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: handleAddItem,
        icon: const Icon(Icons.add_circle),
        label: const Text('Add New'),
      ),
      body: ListView(
        children: [
          for (final todo in todos)
            ListTile(
              onTap: () => todo.completed ? null : handleChangeItem(todo.id),
              trailing: GestureDetector(
                onTap: () => ref.read(todosProvider.notifier).toggle(todo.id),
                child: Icon(todo.completed ? Icons.check_box : Icons.check_box_outline_blank),
              ),
              title: Text(
                todo.description,
                style: TextStyle(
                  decoration: todo.completed ? TextDecoration.lineThrough : TextDecoration.none,
                ),
              ),
            )
        ],
      ),
    );
  }
}
