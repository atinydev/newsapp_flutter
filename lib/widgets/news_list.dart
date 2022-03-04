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
        return _ArticleW(
          article: article,
          index: index,
        );
      },
    );
  }
}

class _ArticleW extends StatelessWidget {
  const _ArticleW({
    Key? key,
    required this.article,
    required this.index,
  }) : super(key: key);

  final Article article;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _TopBarCard(
          article: article,
          index: index,
        ),
        _TitleCard(
          article: article,
        ),
        _ImageCard(
          urlToImage: article.urlToImage ?? "",
        )
      ],
    );
  }
}

class _TopBarCard extends StatelessWidget {
  const _TopBarCard({
    Key? key,
    required this.article,
    required this.index,
  }) : super(key: key);

  final Article article;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      margin: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Text(
            '${index + 1}',
            style: TextStyle(
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
          Text(
            article.source.name,
            style: TextStyle(
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
        ],
      ),
    );
  }
}

class _TitleCard extends StatelessWidget {
  const _TitleCard({
    Key? key,
    required this.article,
  }) : super(key: key);

  final Article article;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Text(
        article.title,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}

class _ImageCard extends StatelessWidget {
  const _ImageCard({
    Key? key,
    required this.urlToImage,
  }) : super(key: key);

  final String urlToImage;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
