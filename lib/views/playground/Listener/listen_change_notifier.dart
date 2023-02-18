import 'package:flutter/material.dart';

import 'package:flutter_edspert/views/playground/listener/notifier_listener.dart';

var itemNotifier = ItemNotifier();

class ListenChangeNotifier extends StatefulWidget {
  const ListenChangeNotifier({Key? key}) : super(key: key);

  @override
  State<ListenChangeNotifier> createState() => _ListenChangeNotifierState();
}

class _ListenChangeNotifierState extends State<ListenChangeNotifier> {
  @override
  void initState() {
    super.initState();
    itemNotifier.addListener(() => mounted ? setState(() {}) : null);
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _goToModifyPage(int index) {
    var route = MaterialPageRoute(builder: (context) => ModifyPage(index: index));
    Navigator.of(context).push(route);
  }

  void _goToAddPage() {
    var route = MaterialPageRoute(builder: (context) => const AddPage());
    Navigator.of(context).push(route);
  }

  void _handleRemoveItem(int index) {
    itemNotifier.removeItem(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Change Notifier Example'),
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _goToAddPage,
        child: const Icon(Icons.add),
      ),
      body: _buildListView(),
    );
  }

  Widget _buildListView() {
    return ListView.builder(
      itemCount: itemNotifier.getSize(),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () => _goToModifyPage(index),
          child: _buildListTile(itemNotifier.getItems(), index),
        );
      },
    );
  }

  Widget _buildListTile(List<String> items, int index) {
    return ListTile(
      leading: CircleAvatar(child: Text(index.toString())),
      title: Text(items[index]),
      contentPadding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      trailing: GestureDetector(
        onTap: () => _handleRemoveItem(index),
        child: const Icon(
          Icons.remove_circle_outline_outlined,
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

    void handleAddItem() {
      if (textEditingController.text.isNotEmpty) {
        itemNotifier.addItem(textEditingController.text);
        Navigator.pop(context);
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Page'),
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: handleAddItem,
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
  const ModifyPage({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    var textEditingController = TextEditingController(text: itemNotifier.getItems()[index]);

    void handleUpdateItem() {
      if (textEditingController.text.isNotEmpty) {
        itemNotifier.modifyItem(index, textEditingController.text);
      }
      Navigator.pop(context);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Modify Page'),
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: handleUpdateItem,
        child: const Icon(Icons.check),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14.0),
        child: TextField(controller: textEditingController),
      ),
    );
  }
}
