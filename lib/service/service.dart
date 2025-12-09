import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Service {
  // Get API key from SharedPreferences
  static Future<String> _getApiKey() async {
    final prefs = await SharedPreferences.getInstance();
    final apiKey = prefs.getString('api_key');

    if (apiKey == null || apiKey.isEmpty) {
      throw Exception('API key not found. Please enter it first.');
    }

    return apiKey;
  }

  static Future<List<dynamic>> fetchNewsBySearching(String query) async {
    final apiKey = await _getApiKey();

    final response = await http.get(
      Uri.parse('https://newsapi.org/v2/everything?q=$query&apiKey=$apiKey'),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      return data['articles'] as List<dynamic>;
    } else {
      // Try to read error message from NewsAPI
      try {
        final Map<String, dynamic> data = json.decode(response.body);
        final message = data['message'] ?? 'Failed to fetch news';
        throw Exception(message);
      } catch (_) {
        throw Exception('Failed to fetch news (code: ${response.statusCode})');
      }
    }
  }

  static Future<List<dynamic>> fetchNewsByCategory(String category) async {
    final apiKey = await _getApiKey();

    final response = await http.get(
      Uri.parse(
        'https://newsapi.org/v2/top-headlines?country=us&category=$category&apiKey=$apiKey',
      ),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      return data['articles'] as List<dynamic>;
    } else {
      try {
        final Map<String, dynamic> data = json.decode(response.body);
        final message = data['message'] ?? 'Failed to fetch news';
        throw Exception(message);
      } catch (_) {
        throw Exception('Failed to fetch news (code: ${response.statusCode})');
      }
    }
  }
}
