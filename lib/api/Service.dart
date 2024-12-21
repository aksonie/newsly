import 'dart:convert';
import 'New.dart';
import 'package:http/http.dart' as http;


class Service{
  final String baseUrl = "https://dev.formandocodigo.com/articles.php";

  Future<List<New>> fetchNews() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => New.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load articles');
    }
  }
  Future<List<New>> fetchNewsKeyword(String keyword) async {
    final response = await http.get(Uri.parse('$baseUrl?description=$keyword'));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => New.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load articles');
    }
  }
}