import 'package:flutter/material.dart';
import 'package:mvvm/utils/routes/routes_name.dart';
import 'package:mvvm/view/chart_view.dart';
import 'package:mvvm/view/getstart_view.dart';
import 'package:mvvm/view/home_view.dart';
import 'package:mvvm/view/login_view.dart';
import 'package:mvvm/view/navbar_view.dart';
import 'package:mvvm/view/setting_view.dart';
import 'package:mvvm/view/signin_view.dart';
import 'package:mvvm/view/tab_view.dart';
import 'package:mvvm/view/welcome1_view.dart';
import 'package:mvvm/view/welcome2_view.dart';
import 'package:mvvm/view/welcome3_view.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.home:
        return MaterialPageRoute(
            builder: (BuildContext context) => const HomeView());
      case RoutesName.navbar:
        return MaterialPageRoute(
            builder: (BuildContext context) => const NavbarView());
      case RoutesName.login:
        return MaterialPageRoute(
            builder: (BuildContext context) => const LoginView());
      case RoutesName.tab:
        return MaterialPageRoute(
            builder: (BuildContext context) => const TabView());
      case RoutesName.chart:
        return MaterialPageRoute(
            builder: (BuildContext context) => ChartView());
      case RoutesName.getStarted:
        return MaterialPageRoute(
            builder: (BuildContext context) => const GetStartView());
      case RoutesName.welcome1:
        return MaterialPageRoute(
            builder: (BuildContext context) => const Welcome1View());
      case RoutesName.welcome2:
        return MaterialPageRoute(
            builder: (BuildContext context) => const Welcome2View());
      case RoutesName.welcome3:
        return MaterialPageRoute(
            builder: (BuildContext context) => const Welcome3View());
      case RoutesName.signin:
        return MaterialPageRoute(
            builder: (BuildContext context) => SigninView());
      case RoutesName.setting:
        return MaterialPageRoute(
            builder: (BuildContext context) => const SettingView());
      // case RoutesName.addReminder:
      //   return MaterialPageRoute(
      //       builder: (BuildContext context) =>  AddReminderScreen(dateTime: null,));
      default:
        return MaterialPageRoute(builder: (_) {
          return const Scaffold(
            body: Center(
              child: Text("No Route Defined"),
            ),
          );
        });
    }
  }
}
