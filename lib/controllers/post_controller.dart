import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/post_model.dart';

class PostController {
  final String apiUrl = 'https://jsonplaceholder.typicode.com/posts';

  Future<List<Post>> fetchPosts() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      List<dynamic> jsonData = jsonDecode(response.body);
      return jsonData.map((post) => Post.fromJson(post)).toList();
    } else {
      throw Exception('Fail to fetch posts data');
    }
  }
}
