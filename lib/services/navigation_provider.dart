import 'package:flutter/material.dart';

class NavigationProvider extends ChangeNotifier {
  var _currentPage = 0;

  int get currentPage => _currentPage;

  set currentPage(int value) {
    _currentPage = value;
    notifyListeners();
  }
}
