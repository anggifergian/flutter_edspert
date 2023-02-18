import 'package:flutter/material.dart';
import 'package:flutter_edspert/views/playground/listener/notifier_listener.dart';

var itemNotifier = ItemNotifier();

class AnimatedChangeNotifier extends StatefulWidget {
  const AnimatedChangeNotifier({Key? key}) : super(key: key);

  @override
  State<AnimatedChangeNotifier> createState() => _AnimatedChangeNotifierState();
}

class _AnimatedChangeNotifierState extends State<AnimatedChangeNotifier> {
  void _handleAddItem() {
    var route = MaterialPageRoute(builder: (context) => const AddPage());
    Navigator.of(context).push(route);
  }

  void _handleDetailItem(int index) {
    var route = MaterialPageRoute(builder: (context) => ModifyPage(index: index));
    Navigator.of(context).push(route);
  }

  void _handleRemoveItem(int index) {
    itemNotifier.removeItem(index);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: itemNotifier,
      builder: (context, child) {
        return Scaffold(
          appBar: _buildAppBar('Animated Change Notifier'),
          floatingActionButton: _buildFloatingButton(),
          body: _buildListView(),
        );
      },
    );
  }

  Widget _buildFloatingButton() {
    return FloatingActionButton(
      onPressed: _handleAddItem,
      child: const Icon(Icons.add),
    );
  }

  Widget _buildListView() {
    return ListView.builder(
      itemCount: itemNotifier.getSize(),
      itemBuilder: (context, index) => GestureDetector(
        onTap: () => _handleDetailItem(index),
        child: _buildListTile(itemNotifier.getItems(), index),
      ),
    );
  }

  Widget _buildListTile(List<String> items, int index) {
    return ListTile(
      leading: CircleAvatar(child: Text(index.toString())),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      title: Text(items[index]),
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
  const AddPage({super.key});

  @override
  Widget build(BuildContext context) {
    var textEditingController = TextEditingController(text: '');

    void handleAddItem() {
      itemNotifier.addItem(textEditingController.text);
      Navigator.pop(context);
    }

    return Scaffold(
      appBar: _buildAppBar('Add Page'),
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

    void handleEditItem() {
      if (textEditingController.text.isNotEmpty) {
        itemNotifier.modifyItem(index, textEditingController.text);
      }
      Navigator.pop(context);
    }

    return Scaffold(
      appBar: _buildAppBar('Modify Page'),
      floatingActionButton: FloatingActionButton(
        onPressed: handleEditItem,
        child: const Icon(Icons.check),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14.0),
        child: TextField(controller: textEditingController),
      ),
    );
  }
}

AppBar _buildAppBar(String title) {
  return AppBar(
    title: Text(title),
    elevation: 0,
  );
}
