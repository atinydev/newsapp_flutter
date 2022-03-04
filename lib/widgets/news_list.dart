import 'package:flutter/material.dart';
import 'package:newsapp/models/models.dart';

class NewsList extends StatelessWidget {
  const NewsList({
    Key? key,
    required this.news,
  }) : super(key: key);

  final List<Article> news;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: news.length,
      itemBuilder: (context, index) {
        final article = news[index];
        return ListTile(
          title: Text(article.title),
        );
      },
    );
  }
}
