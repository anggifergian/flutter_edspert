import 'package:flutter/material.dart';

class PlaygroundChangeNotifier extends StatefulWidget {
  const PlaygroundChangeNotifier({super.key});

  @override
  State<StatefulWidget> createState() => _PlaygroundChangeNotifier();
}

class _PlaygroundChangeNotifier extends State<PlaygroundChangeNotifier> {
  List<String> todoList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: todoList.length,
        itemBuilder: (context, index) => _buildListTile(todoList, index),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            todoList.add("Random Value");
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildListTile(List<String> items, int index) {
    return ListTile(
      leading: CircleAvatar(
        child: Text(index.toString()),
      ),
      title: Text(items[index]),
      contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
    );
  }
}
