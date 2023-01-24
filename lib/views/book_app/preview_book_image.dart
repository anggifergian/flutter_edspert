import 'package:flutter/material.dart';

class PreviewBookImage extends StatelessWidget {
  final String? photoUrl;

  const PreviewBookImage({super.key, this.photoUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Preview'),
      ),
      body: Row(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.network(
                  photoUrl!,
                  fit: BoxFit.contain,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
