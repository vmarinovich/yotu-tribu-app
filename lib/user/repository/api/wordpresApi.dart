import 'package:http/http.dart' as http;
import 'dart:convert';

final dominiourl = 'http://colbay.co/horoscopo/wp-json/wp/v2/categories';

Future<List> post() async {
  final response =
      await http.get(dominiourl, headers: {'Accept': 'application/json'});
  var convertiarjson = jsonDecode(response.body);
  print(convertiarjson);
  return convertiarjson;
}
