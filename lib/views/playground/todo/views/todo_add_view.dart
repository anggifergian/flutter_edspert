import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_edspert/views/playground/todo/models/todo_model.dart';
import 'package:flutter_edspert/views/playground/todo/controllers/todos_notifier.dart';

class TodoAddView extends ConsumerWidget {
  const TodoAddView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var todos = ref.watch(todosProvider);

    var textEditingController = TextEditingController(text: '');

    void handleAddTodo() {
      if (textEditingController.text.isNotEmpty) {
        final todo = Todo(
          id: (todos.length + 1).toString(),
          description: textEditingController.text,
        );

        ref.read(todosProvider.notifier).addTodo(todo);
      }

      Navigator.pop(context);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('New'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 20),
          child: Column(
            children: [
              TextField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('New item'),
                ),
                controller: textEditingController,
              ),
              const SizedBox(height: 12),
              ElevatedButton(
                onPressed: handleAddTodo,
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.check),
                    SizedBox(width: 4),
                    Text('Add Item'),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
