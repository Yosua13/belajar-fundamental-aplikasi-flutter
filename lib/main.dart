import 'package:training/4_networking/2_http/fetch_content.dart';
import 'package:training/4_networking/2_http/get_content.dart';

void main() async {
  getContent();
  postContent();
  putContent();
  deleteContent();
  final output = await fetchContent();
  switch (output) {
    case Success(value: var data):
      print("Success: $data");
    case Failure(error: var message):
      print("Failure: $message");
  }
}
