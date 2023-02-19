import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter_edspert/views/playground/listener/notifier_listener.dart';
import 'package:flutter_edspert/views/playground/dependency_injection/add_page.dart';
import 'package:flutter_edspert/views/playground/dependency_injection/modify_page.dart';

class DependencyInjection extends StatefulWidget {
  const DependencyInjection({Key? key}) : super(key: key);

  @override
  State<DependencyInjection> createState() => _DependencyInjectionState();
}

class _DependencyInjectionState extends State<DependencyInjection> {
  void _handleDeleteItem(int index) {
    Provider.of<ItemNotifier>(context, listen: false).removeItem(index);
  }

  void _handleDetailItem(int index) {
    var route = MaterialPageRoute(builder: (context) => ModifyPage(index: index));
    Navigator.of(context).push(route);
  }

  void _handleAddItem() {
    var route = MaterialPageRoute(builder: (context) => const AddPage());
    Navigator.of(context).push(route);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dependency Injection'),
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _handleAddItem,
        child: const Icon(Icons.add),
      ),
      body: Consumer<ItemNotifier>(
        builder: (context, value, child) => _buildListView(value),
      ),
    );
  }

  Widget _buildListView(ItemNotifier value) {
    return ListView.builder(
      itemCount: value.getSize(),
      itemBuilder: (context, index) => GestureDetector(
        onTap: () => _handleDetailItem(index),
        child: _buildListTile(value.getItems(), index),
      ),
    );
  }

  Widget _buildListTile(List items, int index) {
    return ListTile(
      leading: CircleAvatar(child: Text(index.toString())),
      contentPadding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 8.0),
      title: Text(items[index]),
      trailing: GestureDetector(
        onTap: () => _handleDeleteItem(index),
        child: const Icon(Icons.remove_circle_outline_rounded, color: Colors.amber),
      ),
    );
  }
}
