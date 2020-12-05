import 'dart:convert';

import 'package:http/http.dart' as http;

class Networking {
  Future getData(String url) async {
    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      var decodedData = jsonDecode(response.body);
      return decodedData;
    } else
      print(response.statusCode);
  }
}
