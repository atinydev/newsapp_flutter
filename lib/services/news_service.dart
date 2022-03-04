import 'package:flutter/material.dart';

class NewsService extends ChangeNotifier {
  final headlines = [];

  NewsService() {
    getTopHeadlines();
  }

  Future<void> getTopHeadlines() async {}
}
