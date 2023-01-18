import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter_edspert/configs/environment.dart';
import 'package:flutter_edspert/models/post.dart';

class JPHService {
  final String endpoint = '${Environment.jsonPlaceHolderUrl}/posts';

  Future<List> getPosts() async {
    var res = await http.get(Uri.parse(endpoint));

    if (res.statusCode == 200) {
      var body = jsonDecode(res.body);
      var posts = body.map((item) => Post.fromJson(item)).toList();
      return posts;
    } else {
      throw "Unable to retrieve posts.";
    }
  }
}
