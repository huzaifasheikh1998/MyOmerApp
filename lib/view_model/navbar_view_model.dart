import 'package:flutter/material.dart';
import 'package:mvvm/res/navbar_item.dart';

// const screens = [
//   HomeScreen(),
// TankerScreen(),
// GatePassScreen(),
// BillingScreen(),
// ];

class NavbarViewModel with ChangeNotifier {
  // int _view = 0;
  // get view => _view;

  var _view = NavbarItem.navbarItem[0];
  get view => _view;

  void changeView(int index) {
    // if (index == 0) {
    //   final homeProvider = Provider.of<HomeProvider>(context, listen: false);
    //   homeProvider.changeNavPage();
    //   // homeProvider.changePage(0);
    // }
    _view = NavbarItem.navbarItem[index];
    print(_view);
    notifyListeners();
  }
}
