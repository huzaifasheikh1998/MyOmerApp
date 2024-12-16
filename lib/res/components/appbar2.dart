import 'package:flutter/material.dart';
import 'package:mvvm/res/color.dart';
import 'package:mvvm/res/components/text.dart';
import 'package:mvvm/res/images.dart';

class MyAppBar2 extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  MyAppBar2({required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.thirdColor,
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back_ios,
              color: AppColors.primaryColor,
            )),
        title: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    // padding: EdgeInsets.symmetric(vertical: 5),
                    child: Image.asset(
                  Images.logoTransparent,
                  color: AppColors.secondaryColor,
                  height: 35,
                )),
                SizedBox(
                  width: 13,
                ),
                Content(
                  data: title,
                  size: 25,
                  weight: FontWeight.bold,
                  color: AppColors.primaryColor,
                ),
              ],
            ),
            // Content(
            //   data: "Endurance, Fortitude, Ambition",
            //   size: 15,
            //   color: AppColors.secondaryColor,
            // ),
            SizedBox(
              height: 20,
            ),
          ],
        ));
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
