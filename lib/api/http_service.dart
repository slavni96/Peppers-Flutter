import 'dart:convert';

import 'package:flutter_app/models/post.dart';
import 'package:http/http.dart';

class HttpService {
  final String baseUrl = "http://localhost:4000";

  Future<List<Post>> getPosts() async {
    String url = baseUrl + "/peppers";
    Response response = await get(url);

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);

      List<Post> posts = data
          .map(
            (dynamic item) => Post.fromJson(item),
          )
          .toList();

      return posts;
    } else {
      throw "Can't get peppers.";
    }
  }
}
