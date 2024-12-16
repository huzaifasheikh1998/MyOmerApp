import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mvvm/res/color.dart';
import 'package:mvvm/res/components/text.dart';
import 'package:mvvm/res/images.dart';
import 'package:mvvm/res/size.dart';

import '../utils/routes/routes_name.dart';

class Welcome2View extends StatelessWidget {
  const Welcome2View({super.key});

  @override
  Widget build(BuildContext context) {
    Sized sized = Sized(context);
    return Scaffold(
      body: SafeArea(
          child: Container(
        color: AppColors.thirdColor,
        child: Stack(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    Images.calender,
                    color: AppColors.dayWeekColorList[4],
                    height: sized.height(0.2),
                    fit: BoxFit.cover,
                  ),
                  SizedBox(
                    height: sized.height(0.02),
                  ),
                  Content(
                    data: "Never miss a day.",
                    size: sized.height(0.025),
                    weight: FontWeight.w600,
                    color: AppColors.primaryColor,
                    alignment: TextAlign.center,
                  ),
                  SizedBox(
                    height: sized.height(0.02),
                  ),
                  Content(
                    data:
                        "Get smart notification, a process\ntracker and blessings toggle to keep\nyou up to speed.",
                    size: sized.height(0.02),
                    weight: FontWeight.w500,
                    color: AppColors.primaryColor,
                    alignment: TextAlign.center,
                  ),
                  SizedBox(
                    height: sized.height(0.2),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: 30, bottom: 30, left: 40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, RoutesName.signin);
                          },
                          child: Content(
                            data: "Skip",
                            size: sized.height(0.024),
                            color: AppColors.primaryColor,
                            weight: FontWeight.w400,
                          )),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, RoutesName.welcome3);
                        },
                        child: Container(
                            child: Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: sized.height(0.05),
                          color: AppColors.primaryColor,
                        )),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
