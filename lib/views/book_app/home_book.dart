import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:flutter_edspert/configs/constant.dart';
import 'package:flutter_edspert/configs/environment.dart';
import 'package:flutter_edspert/models/book_app/book.dart';
import 'package:flutter_edspert/views/book_app/detail_book.dart';

class BookHome extends StatefulWidget {
  const BookHome({super.key});

  @override
  State<StatefulWidget> createState() => BookHomeState();
}

class BookHomeState extends State<BookHome> {
  BookListResponse? releaseBooks;

  @override
  void initState() {
    super.initState();
    fetchBooks();
  }

  fetchBooks() async {
    var response = await http.get(Uri.parse('${Environment.itBookApi}/new'));

    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);
      setState(() {
        releaseBooks = BookListResponse.fromJson(body);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Book Catalogue')),
        body: SafeArea(
            child: Container(
                child: releaseBooks == null
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : ListView.builder(
                        itemCount: releaseBooks?.books?.length,
                        itemBuilder: ((context, index) {
                          var book = releaseBooks!.books![index];
                          return GestureDetector(
                            onTap: (() {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      DetailBook(isbn: book.isbn13)));
                            }),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    CachedNetworkImage(
                                      imageUrl: book.image,
                                      width: 120,
                                      fit: BoxFit.cover,
                                    ),
                                    Expanded(
                                        child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(bottom: 4),
                                          child: Text(
                                            book.title,
                                            style: const TextStyle(
                                                fontSize: 13,
                                                color: Colors.black87),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(bottom: 8),
                                          child: Text(
                                            book.subtitle,
                                            style: const TextStyle(
                                                fontSize: 12,
                                                color: Colors.black54),
                                          ),
                                        ),
                                        Text(
                                          book.price,
                                          style: const TextStyle(
                                              fontSize: 14,
                                              color: Colors.black87,
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ))
                                  ],
                                ),
                                const Divider(
                                  height: 2,
                                  thickness: 1,
                                  color: secondaryColor10LightTheme,
                                )
                              ],
                            ),
                          );
                        })))));
  }
}
