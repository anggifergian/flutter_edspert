import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter_edspert/models/book_app/book.dart';
import 'package:flutter_edspert/configs/environment.dart';

class BookService {
  final String endpoint = Environment.itBookApi;

  Future<BookListResponse> listReleases() async {
    var response = await http.get(Uri.parse('$endpoint/new'));

    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);
      var books = BookListResponse.fromJson(body);
      return books;
    } else {
      throw "Unable to retrieve books.";
    }
  }
}
