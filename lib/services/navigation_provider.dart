import 'package:flutter/material.dart';

class NavigationProvider extends ChangeNotifier {
  var _currentPage = 0;
  final pageController = PageController();

  int get currentPage => _currentPage;

  set currentPage(int value) {
    _currentPage = value;
    pageController.animateToPage(
      value,
      curve: Curves.easeOut,
      duration: const Duration(milliseconds: 250),
    );
    notifyListeners();
  }
}
