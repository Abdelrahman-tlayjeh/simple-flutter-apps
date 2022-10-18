import 'package:http/http.dart';
import '../models/post.dart';

class ApiHandler {
  Future<List<Post>> getPosts() async {
    Client client = Client();
    Uri uri = Uri.parse("https://jsonplaceholder.typicode.com/posts");

    //await response
    Response response = await client.get(uri);

    //if no response
    if (response.statusCode != 200) {
      throw Exception("API is not responding!");
    }
    // got response
    return postFromJson(response.body);
  }
}
