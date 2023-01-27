import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:readmore/readmore.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter_edspert/configs/environment.dart';
import 'package:flutter_edspert/models/book_app/book.dart';
import 'package:flutter_edspert/views/book_app/related_book.dart';
import 'package:flutter_edspert/views/book_app/preview_book_image.dart';

class DetailBook extends StatefulWidget {
  final String isbn;

  const DetailBook({super.key, required this.isbn});

  @override
  State<StatefulWidget> createState() => DetailBookState();
}

class DetailBookState extends State<DetailBook> {
  BookDetail? book;
  BookListResponse? relatedBooks;

  @override
  void initState() {
    super.initState();
    fetchDetail();
  }

  void fetchDetail() async {
    var response = await http
        .get(Uri.parse('${Environment.itBookApi}/books/${widget.isbn}'));

    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);
      setState(() {
        book = BookDetail.fromJson(body);

        fetchRelatedBooks(book!.title);
      });
    }
  }

  void fetchRelatedBooks(String title) async {
    Uri endpoint = Uri.parse('${Environment.itBookApi}/search/$title');
    var response = await http.get(endpoint);

    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);
      setState(() {
        relatedBooks = BookListResponse.fromJson(body);
      });
    }
  }

  Future<void> _launchUrl() async {
    if (!await launchUrl(Uri.parse(book!.url))) {
      throw Exception("Could not launch ${book!.url}");
    }
  }

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment:
              book == null ? MainAxisAlignment.center : MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (book == null) ...[
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              )
            ] else ...[
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                child: Column(
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => PreviewBookImage(
                                      photoUrl: book!.image,
                                    )));
                          },
                          child: CachedNetworkImage(
                            imageUrl: book!.image,
                            fit: BoxFit.cover,
                            width: 120,
                          ),
                        ),
                        Expanded(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              book!.title,
                              style: const TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w600),
                            ),
                            Text(
                              book!.authors,
                              style: const TextStyle(
                                  fontSize: 12, color: Colors.grey),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Row(
                                children: List.generate(
                                    5,
                                    (index) => Icon(
                                          Icons.star,
                                          size: 20,
                                          color: index < int.parse(book!.rating)
                                              ? Colors.yellow
                                              : Colors.grey,
                                        ))),
                            const SizedBox(
                              height: 4,
                            ),
                            Text(
                              book!.subtitle,
                              style: const TextStyle(
                                  fontSize: 12,
                                  color: Colors.black54,
                                  fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(
                              book!.price,
                              style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.green,
                                  fontWeight: FontWeight.w600),
                            )
                          ],
                        ))
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                            onPressed: () => _launchUrl(),
                            child: const Text('Buy'))),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(bottom: 8, top: 20),
                            child: Text(
                              'Description',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w600),
                            ),
                          ),
                          ReadMoreText(
                            book!.desc,
                            style: const TextStyle(height: 1.4),
                            trimLines: 3,
                            trimMode: TrimMode.Line,
                            trimCollapsedText: 'Read more',
                            trimExpandedText: 'Show less',
                          ),
                          const Padding(
                            padding: EdgeInsets.only(bottom: 4, top: 20),
                            child: Text(
                              'Details',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w600),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            child: Text("Year: ${book!.year}"),
                          ),
                          const Divider(
                            height: 1,
                            thickness: 1,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            child: Text("ISBN: ${book!.isbn13}"),
                          ),
                          const Divider(
                            height: 1,
                            thickness: 1,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            child: Text("Pages: ${book!.pages}"),
                          ),
                          const Divider(
                            height: 1,
                            thickness: 1,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            child: Text("Publisher: ${book!.publisher}"),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(bottom: 4, top: 20),
                            child: Text(
                              'Related Books',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w600),
                            ),
                          ),
                          if (relatedBooks == null) ...[
                            const Center(
                              child: CircularProgressIndicator(),
                            )
                          ] else ...[
                            SizedBox(
                              height: 200,
                              child: ListView.builder(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemCount: relatedBooks!.books!.length,
                                  itemBuilder: ((context, index) {
                                    return RelatedBook(
                                        book: relatedBooks!.books![index]);
                                  })),
                            )
                          ]
                        ])
                  ],
                ),
              ),
            ]
          ],
        ),
      ),
    );
  }
}
