import 'dart:convert';

import 'package:http/http.dart' as http;

class Service {
  static const String apiKey = '9c8d45e95a124fa3ab7707e836444231';
  static Future<List<dynamic>> fetchNewsBySearching(String query) async {
    final response = await http.get(
      Uri.parse(
        'https://newsapi.org/v2/everything?q=$query&apiKey=9c8d45e95a124fa3ab7707e836444231',
      ),
    );
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      return data['articles'];
    } else {
      throw Exception('Failed to fetch the news');
    }
  }

  static Future<List<dynamic>> fetchNewsByCategory(String category) async {
    final response = await http.get(
      Uri.parse(
        'https://newsapi.org/v2/top-headlines?country=us&category=$category&apiKey=$apiKey',
      ),
    );
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      return data['articles'];
    } else {
      throw Exception('Failed to fetch');
    }
  }
}
