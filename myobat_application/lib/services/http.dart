import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
  // static const String apiUrl = 'http://your-laravel-backend-url/api';
  static const String apiUrl = 'http://10.0.2.2:8000/api';
  // static const String apiUrl = 'http://ec2-100-28-205-231.compute-1.amazonaws.com/api';

  Future<List<dynamic>> fetchPosts() async {
    final response = await http.get(Uri.parse('$apiUrl/posts'));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load posts');
    }
  }

  // Other CRUD methods here (createPost, getPost, updatePost, deletePost)
}
