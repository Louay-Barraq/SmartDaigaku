// ignore_for_file: constant_identifier_names

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'quotes_model.dart';

class QuoteService {
  static const BASE_URL = 'https://zenquotes.io/api/today';

  Future<QuoteModel> fetchQuoteOfTheDay() async {
    final prefs = await SharedPreferences.getInstance();
    final currentDate = DateTime.now().toIso8601String().substring(0, 10);

    final cachedQuote = prefs.getString('cachedQuote');
    final cachedDate = prefs.getString('cachedDate');

    if (cachedDate == currentDate && cachedQuote != null) {
      return QuoteModel.fromJson(jsonDecode(cachedQuote));
    } else {
      try {
        final response = await http.get(Uri.parse(BASE_URL));
        if (response.statusCode == 200) {
          final data = jsonDecode(response.body)[0];
          final newQuote = QuoteModel.fromJson({
            'q': data['q'],
            'a': data['a'],
          });

          await prefs.setString(
              'cachedQuote',
              jsonEncode({
                'q': newQuote.quote,
                'a': newQuote.author,
              }));
          await prefs.setString('cachedDate', currentDate);

          return newQuote;
        } else {
          throw Exception('Failed to load quote of the day');
        }
      } catch (e) {
        throw Exception('Failed to load quote of the day');
      }
    }
  }
}
