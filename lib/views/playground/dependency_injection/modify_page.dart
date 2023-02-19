import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter_edspert/views/playground/listener/notifier_listener.dart';

class ModifyPage extends StatelessWidget {
  const ModifyPage({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    var textEditingController = TextEditingController(
      text: Provider.of<ItemNotifier>(context, listen: false).getItems()[index],
    );

    void handleEditItem() {
      Provider.of<ItemNotifier>(context, listen: false).modifyItem(index, textEditingController.text);
      Navigator.pop(context);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('DI - Modify Page'),
        elevation: 0,
      ),
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
