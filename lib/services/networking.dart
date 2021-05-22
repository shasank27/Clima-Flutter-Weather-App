import 'package:http/http.dart' as http;
import 'dart:convert';

class Network {
  double temperature;
  int condition;
  String cityname;

  Future getData(String url) async {
    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }
}
