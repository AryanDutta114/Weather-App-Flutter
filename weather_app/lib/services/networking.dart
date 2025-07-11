import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  final String url;

  NetworkHelper(this.url);

  Future<dynamic> getData() async {
    try {
      Uri uri = Uri.parse(url); // Always use Uri.parse for safety
      http.Response response = await http.get(uri);

      if (response.statusCode == 200) {
        String data = response.body;
        return jsonDecode(data);
      } else {
        print('Failed to get data. Status code: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print('Error fetching data: $e');
      return null;
    }
  }
}
