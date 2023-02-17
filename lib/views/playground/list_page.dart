import 'package:flutter/material.dart';

List<String> todoList = <String>[];

class ListPage extends StatefulWidget {
  const ListPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  void _goToAddPage() {
    var route = MaterialPageRoute(builder: (context) => const AddPage());

    Navigator.of(context).push(route).then((value) {
      setState(() {});
    });
  }

  void _goToModifyPage(int index) {
    var route = MaterialPageRoute(builder: (context) => ModifyPage(index: index));

    Navigator.of(context).push(route).then((value) {
      setState(() {});
    });
  }

  void _removeFromList(int index) {
    todoList.removeAt(index);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Global Variable Playground'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _goToAddPage,
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => _goToModifyPage(index),
            child: _buildListTile(todoList, index),
          );
        },
        itemCount: todoList.length,
      ),
    );
  }

  Widget _buildListTile(List<String> items, int index) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: index % 2 == 0 ? Colors.greenAccent : Colors.lightBlue,
        child: Text(index.toString()),
      ),
      title: Text(items[index]),
      contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      trailing: GestureDetector(
        onTap: () => _removeFromList(index),
        child: const Icon(
          Icons.remove_circle_outline_rounded,
          color: Colors.amber,
        ),
      ),
    );
  }
}

class AddPage extends StatelessWidget {
  const AddPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var textEditingController = TextEditingController(text: '');

    void handleAddList() {
      todoList.add(textEditingController.text);
      Navigator.pop(context);
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: const Text('Add ToDoItem'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: handleAddList,
        child: const Icon(Icons.add),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14.0),
        child: TextField(controller: textEditingController),
      ),
    );
  }
}

class ModifyPage extends StatelessWidget {
  const ModifyPage({Key? key, required this.index}) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    var textEditingController = TextEditingController(text: todoList[index]);

    void handleUpdateList() {
      todoList[index] = textEditingController.text;
      Navigator.pop(context);
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: const Text('Update ToDoItem'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: handleUpdateList,
        child: const Icon(Icons.check),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14.0),
        child: TextField(controller: textEditingController),
      ),
    );
  }
}
