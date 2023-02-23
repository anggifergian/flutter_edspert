import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PlaygroundFutureBuilder extends StatefulWidget {
  const PlaygroundFutureBuilder({Key? key}) : super(key: key);

  @override
  State<PlaygroundFutureBuilder> createState() => _PlaygroundFutureBuilderState();
}

class _PlaygroundFutureBuilderState extends State<PlaygroundFutureBuilder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Future Builder Playground'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {});
        },
        child: const Icon(Icons.refresh),
      ),
      body: FutureBuilder(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            debugPrint('[1] Connection Done');
            debugPrint("Data=${snapshot.data}");

            if (snapshot.hasError) {
              debugPrint('[1.1] Data Error');
              return _buildErrorText();
            } else if (snapshot.hasData) {
              if (snapshot.data!.isEmpty) {
                return const Center(child: Text('Data Received, but is empty'));
              }

              debugPrint('[1.2] Data Success');
              return _buildImage(snapshot);
            } else {
              debugPrint('[1.3] No Data');
              return _buildNoDataReceivedText();
            }
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            debugPrint('[2] Connection Waiting');
            return _buildLoadingIndicator();
          }

          debugPrint('[3] Connection Completed');
          return Text("State: ${snapshot.connectionState}");
        },
      ),
    );
  }

  Widget _buildImage(AsyncSnapshot snapshot) {
    return Center(child: CachedNetworkImage(imageUrl: snapshot.data));
  }

  Widget _buildNoDataReceivedText() {
    return const Center(child: Text('No Data Received'));
  }

  Widget _buildLoadingIndicator() {
    return const Center(child: CircularProgressIndicator());
  }

  Widget _buildErrorText() {
    return const Center(child: Text('An Error Occured.'));
  }
}

Future<String> getData() async {
  http.Response res;

  try {
    res = await http.get(Uri.parse('https://api.catboys.com/img'));
  } catch (e) {
    return '';
  }

  Map data = json.decode(res.body);
  return data['url'];
}
