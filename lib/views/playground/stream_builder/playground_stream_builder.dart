import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_edspert/views/playground/stream_builder/image_service.dart';

class PlaygroundStreamBuilder extends StatefulWidget {
  const PlaygroundStreamBuilder({Key? key}) : super(key: key);

  @override
  State<PlaygroundStreamBuilder> createState() => _PlaygroundStreamBuilderState();
}

class _PlaygroundStreamBuilderState extends State<PlaygroundStreamBuilder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Stream Builder Playground')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {});
        },
        child: const Icon(Icons.refresh),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: StreamBuilder(
            stream: getDataImage(context),
            builder: (context, snapshot) {
              debugPrint("ConnectionState=${snapshot.connectionState.toString()}");

              if (snapshot.connectionState == ConnectionState.waiting) {
                debugPrint('[Waiting...]');
                return _buildLoadingIndicator();
              }

              if (snapshot.connectionState == ConnectionState.done ||
                  snapshot.connectionState == ConnectionState.active) {
                debugPrint("[Done...] Counter=${snapshot.data!['counter']}");
                if (snapshot.hasError) {
                  return _buildErrorMessage();
                }

                if (snapshot.hasData) {
                  return _buildImageView(snapshot.data?['imageUrl']);
                }
              }

              debugPrint('[Finally...]');
              return const Center(child: Text('No Data Received'));
            },
          ),
        ),
      ),
    );
  }

  Widget _buildErrorMessage() {
    return const Center(child: Text('An Error Occured.'));
  }

  Widget _buildLoadingIndicator() {
    return const Center(child: CircularProgressIndicator());
  }

  Widget _buildImageView(String data) {
    return Center(child: CachedNetworkImage(imageUrl: data));
  }
}
