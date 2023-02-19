import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter_edspert/views/playground/listener/notifier_listener.dart';

class AddPage extends StatelessWidget {
  const AddPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var textEditingController = TextEditingController(text: '');

    void handleAddItem() {
      Provider.of<ItemNotifier>(context, listen: false).addItem(textEditingController.text);
      Navigator.pop(context);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('DI - Add Page'),
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
