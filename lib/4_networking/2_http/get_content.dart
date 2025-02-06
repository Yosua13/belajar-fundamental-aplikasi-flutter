import 'package:http/http.dart' as http;

Future getContent() async {
  final url = Uri.https('jsonplaceholder.typicode.com', 'posts/1');
  final response = await http.get(url);
  print('Response Status: ${response.statusCode}');
  print('Response Body: ${response.body}');
}

Future postContent() async {
  final url = Uri.https('jsonplaceholder.typicode.com', 'posts');
  final response = await http.post(
    url,
    body: {
      "title": 'foo',
      "body": 'bar',
      "userId": '1',
    },
  );

  print("Response Status: ${response.statusCode}");
  print("Response Body: ${response.body}");
}

Future putContent() async {
  final url = Uri.https('jsonplaceholder.typicode.com', 'posts/1');
  final response = await http.put(
    url,
    body: {
      "id": "1",
      "title": 'foo',
      "body": 'bar',
      "userId": "1",
    },
  );
  print('Response status: ${response.statusCode}');
  print('Response body: ${response.body}');
}

Future deleteContent() async {
  final url = Uri.https('jsonplaceholder.typicode.com', 'posts/1');
  final response = await http.delete(url);
  print('Response status: ${response.statusCode}');
  print('Response body: ${response.body}');
}
