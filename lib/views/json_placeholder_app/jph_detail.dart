import 'package:flutter/material.dart';
import 'package:flutter_edspert/models/post.dart';

class JPHDetail extends StatelessWidget {
  final Post post;

  const JPHDetail({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(post.title),
        actions: [
          IconButton(
              onPressed: (() {
                Navigator.of(context).pop();
              }),
              icon: const Icon(Icons.delete))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: ListTile(
                        title: const Text('Title'),
                        subtitle: Text(post.title),
                      ),
                    ),
                    ListTile(
                      title: const Text('ID'),
                      subtitle: Text("${post.id}"),
                    ),
                    ListTile(
                      title: const Text('Body'),
                      subtitle: Text(post.body),
                    ),
                    ListTile(
                      title: const Text('User ID'),
                      subtitle: Text("${post.userId}"),
                    )
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
