import 'dart:convert';
import 'package:http/http.dart' as http;

class WeatherData {
  WeatherData(this.url);
  final String url;

  Future getData() async {
    http.Response response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);
    } else {
      return 'Error: ${response.reasonPhrase}';
    }
  }
}