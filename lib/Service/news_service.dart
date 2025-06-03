import 'dart:convert';

import 'package:http/http.dart' as http;

class NewsService {
  final String apiKey = '9c8d45e95a124fa3ab7707e836444231';

  Future<List<dynamic>> fetchNews({String category = 'general'}) async {
    final url =
    'https://newsapi.org/v2/top-headlines?country=us&category=$category&apiKey=$apiKey';


    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['articles'];
    } else {
      throw Exception('Failed to fetch News');
    }
  }

  Future<List<dynamic>> searchNews(String query) async {
    final url =
        'https://newsapi.org/v2/everything?q=$query&sortBy=publishedAt&apiKey=$apiKey';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['articles'];
    } else {
      throw Exception('Failed to fetch data');
    }
  }
}
