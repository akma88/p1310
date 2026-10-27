import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/post.dart';

class PostApiProvider {
  Future<List<Post>> getPosts() async {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/posts'))
        .timeout(const Duration(seconds: 15));

    if (response.statusCode != 200) {
      throw Exception('Посттарды жүктеу мүмкін болмады');
    }

    final data = jsonDecode(response.body) as List<dynamic>;
    return data
        .map((item) => Post.fromJson(item as Map<String, dynamic>))
        .toList();
  }
}
