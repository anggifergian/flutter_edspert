import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_edspert/views/playground/todo/controllers/todos_notifier.dart';

class TodoEditView extends ConsumerWidget {
  const TodoEditView({super.key, required this.todoID});

  final String todoID;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var todos = ref.watch(todosProvider);

    var textEditingController = TextEditingController(
      text: todos.firstWhere((element) => element.id == todoID).description,
    );

    void handleModifyItem() {
      ref.read(todosProvider.notifier).modifyTodo(todoID, textEditingController.text);

      Navigator.pop(context);
    }

    void handleRemoveItem() {
      ref.read(todosProvider.notifier).removeTodo(todoID);

      Navigator.pop(context);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 20),
          child: Column(
            children: [
              TextField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Item'),
                ),
                controller: textEditingController,
              ),
              const SizedBox(height: 12),
              ElevatedButton(
                onPressed: handleModifyItem,
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.check),
                    SizedBox(width: 4),
                    Text('Update Item'),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              ElevatedButton(
                onPressed: handleRemoveItem,
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50),
                  backgroundColor: Colors.redAccent,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.delete),
                    SizedBox(width: 4),
                    Text('Remove'),
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
