import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:newsapp/hardcode/hardcode.dart';
import 'package:newsapp/models/models.dart';

class NewsService extends ChangeNotifier {
  final headlines = <Article>[];
  final _authority = 'newsapi.org';
  final _unencodedPath = 'v2/top-headlines';
  final _apiKey = HardCode.env.apiKey;

  NewsService() {
    getTopHeadlines();
  }

  Future<void> getTopHeadlines() async {
    final url = Uri.https(_authority, _unencodedPath, {
      'country': 'us',
      'apiKey': _apiKey,
    });
    final resp = await http.get(url);
    final newsResponse = NewsResponse.fromJson(resp.body);
    headlines.addAll(newsResponse.articles);
    notifyListeners();
  }
}
