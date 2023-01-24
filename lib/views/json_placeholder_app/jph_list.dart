import 'package:flutter/material.dart';

import 'package:flutter_edspert/services/jph_service.dart';
import 'package:flutter_edspert/views/json_placeholder_app/jph_detail.dart';

class JPHList extends StatelessWidget {
  const JPHList({super.key});

  @override
  Widget build(BuildContext context) {
    var futureBuilder = FutureBuilder(
      future: JPHService().getPosts(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          var posts = snapshot.data;
          return ListView(
            children: posts!
                .map((post) => ListTile(
                      title: Text(post.title),
                      subtitle: Text("${post.id}"),
                      onTap: (() => Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: ((context) => JPHDetail(post: post))))),
                    ))
                .toList(),
          );
        }

        return const Center(child: CircularProgressIndicator());
      },
    );

    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: futureBuilder,
    );
  }
}
