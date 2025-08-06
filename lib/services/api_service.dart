import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/post.dart';

class ApiService {
  Future<List<Post>> fetchPosts() async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

    final List data = jsonDecode(response.body);
    return data.map((json) => Post.fromJson(json)).toList();
  }
}
