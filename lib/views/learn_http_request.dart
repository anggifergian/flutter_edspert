import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LearnHttpRequest extends StatelessWidget {
  const LearnHttpRequest({super.key});

  Future<List<dynamic>> _fetchProducts() async {
    String endpoint2 = 'https://reqres.in/api/users?per_page=15';

    var result = await http.get(Uri.parse(endpoint2));
    return json.decode(result.body)['data'];
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _fetchProducts(),
      builder: ((context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            padding: const EdgeInsets.all(20),
            itemCount: snapshot.data!.length,
            itemBuilder: ((context, index) {
              return ListTile(
                contentPadding: const EdgeInsets.only(bottom: 10),
                leading: CircleAvatar(
                  radius: 30,
                  backgroundImage:
                      NetworkImage(snapshot.data![index]['avatar']),
                ),
                title: Text(snapshot.data![index]['first_name'] +
                    " " +
                    snapshot.data![index]['last_name']),
                subtitle: Text(snapshot.data![index]['email']),
              );
            }),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      }),
    );
  }
}
