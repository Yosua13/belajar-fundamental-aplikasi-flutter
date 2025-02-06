import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:training/4_networking/2_http/post.dart';
import 'package:training/4_networking/2_http/result.dart';

Future<Result<Post>> fetchContent() async {
  try {
    final url = Uri.https('jsonplaceholder.typicode.com', 'posts/1');
    final response = await http.get(url);
    if (response.statusCode == 200 || response.statusCode == 201) {
      final jsonResponse = jsonDecode(response.body);
      final post = Post.fromJson(jsonResponse);
      return Success(post);
    } else {
      return Failure('Failed to fetch data');
    }
  } catch (e) {
    if (e is SocketException) {
      return Failure('No Internet Connection. Please try again later.');
    } else if (e is TimeoutException) {
      return Failure('Request timed out. Please try again later.');
    } else if (e is FormatException) {
      return Failure('Failed to load response data.');
    } else {
      return Failure("Caught an error: $e");
    }
  }
}
