import 'package:flutter/material.dart';

class ExerciseViewModel with ChangeNotifier {
  int _index = 0;
  get index => _index;
  bool _notification = false;
  get notification => _notification;

  List<bool> _notiList = [];
  get notiList => _notiList;
  setNotiList(bool value) {
    _notiList.add(value);
  }

  initializeNotiList() {
    _notiList.clear();
  }

  setNotification(bool status) {
    print(status);
    _notification = status;
    notifyListeners();
  }

  setIndex(int value) {
    _index = value;
    notifyListeners();
  }
}
