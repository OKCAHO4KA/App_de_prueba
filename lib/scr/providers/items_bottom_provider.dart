import 'package:flutter/material.dart';

class ItemsBottomProvider extends ChangeNotifier {
  int _currentIndex = 3;
  int get currentIndex => _currentIndex;

  set currentIndex(int i) {
    _currentIndex = i;
    notifyListeners();
  }
}
