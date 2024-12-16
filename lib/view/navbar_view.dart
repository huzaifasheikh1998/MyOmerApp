import 'package:flutter/material.dart';
import 'package:mvvm/res/components/navbar.dart';
import 'package:mvvm/res/size.dart';
import 'package:mvvm/view_model/navbar_view_model.dart';
import 'package:provider/provider.dart';

class NavbarView extends StatelessWidget {
  const NavbarView({super.key});

  @override
  Widget build(BuildContext context) {
    Sized sized = Sized(context);
    // final navbarProvider = Provider.of<NavbarProvide>(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        // height: sized.height(1),
        child: Stack(
          children: [
            Consumer<NavbarViewModel>(builder: (context, value, child) {
              return value.view;
            }),
            //  screens[selectedIndex],
            Positioned(
                // bottom: 1,
                child: NavBar())
          ],
        ),
      ),
    );
  }
}
