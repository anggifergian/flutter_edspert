import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Stream<Map> getDataImage(BuildContext context) async* {
  int i = 1;

  while (i < 10) {
    // Show snackbar
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('Getting new image-$i'),
      duration: const Duration(seconds: 1),
    ));

    // Get data from API
    Uri url = Uri.parse('https://api.catboys.com/img');
    http.Response response = await http.get(url);
    Map data = jsonDecode(response.body);

    // Return the value received using yield keyword
    yield {'imageUrl': data['url'] as String, 'counter': i};

    // Delay the next yield by 5 seconds
    await Future.delayed(const Duration(seconds: 5));
    i++;
  }
}
