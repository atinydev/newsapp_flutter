import 'package:flutter/material.dart';
import 'package:newsapp/services/services.dart';
import 'package:newsapp/widgets/widgets.dart';
import 'package:provider/provider.dart';

class Tab1Screen extends StatelessWidget {
  const Tab1Screen({Key? key}) : super(key: key);

  static const routeName = 'Tab1';

  @override
  Widget build(BuildContext context) {
    return Consumer<NewsService>(
      builder: (context, newsService, child) {
        return Scaffold(
          body: NewsList(
            news: newsService.headlines,
          ),
        );
      },
    );
  }
}
