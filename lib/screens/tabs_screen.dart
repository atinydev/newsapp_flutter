import 'package:flutter/material.dart';
import 'package:newsapp/screens/screens.dart';
import 'package:newsapp/services/services.dart';
import 'package:provider/provider.dart';

class TabsScreen extends StatelessWidget {
  const TabsScreen({Key? key}) : super(key: key);

  static const routeName = 'Tabs';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: _Pages(),
      bottomNavigationBar: _Navigation(),
    );
  }
}

class _Pages extends StatelessWidget {
  const _Pages({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final navigationProvider = Provider.of<NavigationProvider>(context);
    return PageView(
      controller: navigationProvider.pageController,
      physics: const NeverScrollableScrollPhysics(),
      children: const [
        Tab1Screen(),
        Tab2Screen(),
      ],
    );
  }
}

class _Navigation extends StatelessWidget {
  const _Navigation({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<NavigationProvider>(
      builder: (context, navigationProvider, child) {
        return BottomNavigationBar(
          currentIndex: navigationProvider.currentPage,
          onTap: (index) {
            navigationProvider.currentPage = index;
            final newService = Provider.of<NewsService>(
              context,
              listen: false,
            );
            newService.selectedCategory = newService.selectedCategory;
          },
          items: const [
            BottomNavigationBarItem(
              label: 'For you',
              icon: Icon(Icons.person_outline),
            ),
            BottomNavigationBarItem(
              label: 'Headlines',
              icon: Icon(Icons.public),
            ),
          ],
        );
      },
    );
  }
}
