import 'package:flutter/material.dart';

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
    return PageView(
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Container(
          color: Colors.red,
        ),
        Container(
          color: Colors.green,
        ),
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
    return BottomNavigationBar(
      currentIndex: 1,
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
  }
}
