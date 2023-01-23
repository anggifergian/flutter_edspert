import 'dart:convert';

import 'package:flutter_edspert/models/book.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_edspert/configs/environment.dart';

class BookService {
  final String endpoint = Environment.itBookApi;

  Future<List> list() async {
    var response = await http.get(Uri.parse('$endpoint/new'));

    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);
      var books = body.map((item) => Book.fromJson(item)).toList();
      return books;
    } else {
      throw "Unable to retrieve books";
    }
  }
}
