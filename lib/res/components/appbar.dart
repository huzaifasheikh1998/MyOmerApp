import 'package:flutter/material.dart';
import 'package:mvvm/res/color.dart';
import 'package:mvvm/res/components/text.dart';
import 'package:mvvm/res/images.dart';
import 'package:mvvm/utils/routes/routes_name.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  MyAppBar({required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, RoutesName.tab);
          },
          child: Container(
              padding: EdgeInsets.symmetric(vertical: 5),
              child: Image.asset(
                Images.logoTransparent,
                color: AppColors.thirdColor,
                height: 15,
              )),
        ),
        title: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Content(
              data: "NETZACH",
              size: 25,
              weight: FontWeight.bold,
              color: AppColors.secondaryColor,
            ),
            Content(
              data: "Endurance, Fortitude, Ambition",
              size: 15,
              color: AppColors.secondaryColor,
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ));
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
