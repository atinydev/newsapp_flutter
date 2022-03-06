import 'package:flutter/material.dart';
import 'package:newsapp/services/services.dart';
import 'package:newsapp/widgets/widgets.dart';
import 'package:provider/provider.dart';

class Tab1Screen extends StatefulWidget {
  const Tab1Screen({Key? key}) : super(key: key);

  static const routeName = 'Tab1';

  @override
  State<Tab1Screen> createState() => _Tab1ScreenState();
}

class _Tab1ScreenState extends State<Tab1Screen>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Consumer<NewsService>(
      builder: (context, newsService, child) {
        final headlines = newsService.headlines;
        return Scaffold(
          body: (headlines.isNotEmpty)
              ? NewsList(
                  news: headlines,
                )
              : const _Indicator(),
        );
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class _Indicator extends StatelessWidget {
  const _Indicator({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: Theme.of(context).primaryColor,
      ),
    );
  }
}
