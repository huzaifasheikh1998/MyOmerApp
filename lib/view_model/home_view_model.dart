import 'package:flutter/material.dart';

class HomeViewModel with ChangeNotifier {
  int _index = 0;
  get index => _index;
  int _index2 = 0;
  get index2 => _index2;

  setIndex(int value) {
    _index = value;
    notifyListeners();
  }

  setIndex2(int value) {
    _index2 = value;
    notifyListeners();
  }

  setInitial() {
    _index = 0;
    _index2 = 0;
  }
}
