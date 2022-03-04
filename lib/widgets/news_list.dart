import 'package:flutter/material.dart';
import 'package:newsapp/hardcode/hardcode.dart';
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
          urlToImage: article.urlToImage,
        ),
        _BodyCard(text: article.content),
        const _ButtonsCard(),
        const SizedBox(
          height: 10,
        ),
        const Divider(),
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
            '${index + 1}. ',
            style: TextStyle(
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
          Text(
            article.source.name,
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

  final String? urlToImage;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(50),
          bottomRight: Radius.circular(50),
        ),
        child: (urlToImage != null)
            ? FadeInImage(
                placeholder: AssetImage(HardCode.images.loadingGif),
                image: NetworkImage(urlToImage!),
              )
            : Image.asset(HardCode.images.noImagePng),
      ),
    );
  }
}

class _BodyCard extends StatelessWidget {
  const _BodyCard({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String? text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Text(text ?? ''),
    );
  }
}

class _ButtonsCard extends StatelessWidget {
  const _ButtonsCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RawMaterialButton(
          onPressed: () {},
          fillColor: Theme.of(context).colorScheme.secondary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: const Icon(Icons.star_border),
        ),
        const SizedBox(width: 10),
        RawMaterialButton(
          onPressed: () {},
          fillColor: Colors.blue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: const Icon(Icons.more),
        ),
      ],
    );
  }
}
