import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mvvm/res/color.dart';
import 'package:mvvm/res/components/text.dart';
import 'package:mvvm/res/images.dart';
import 'package:mvvm/res/size.dart';
import 'package:mvvm/utils/routes/routes_name.dart';

class GetStartView extends StatelessWidget {
  const GetStartView({super.key});

  @override
  Widget build(BuildContext context) {
    Sized sized = Sized(context);
    return Scaffold(
      body: SafeArea(
          child: Container(
        decoration: BoxDecoration(
          // image: DecorationImage(image: AssetImage(Images.logoTransparent,),fit: BoxFit.cover),
          color: AppColors.thirdColor,
        ),
        width: sized.width(1),
        child: Stack(
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // SizedBox(height: sized.height(0.15),),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Content(
                    data: "ME365",
                    size: sized.height(0.05),
                    weight: FontWeight.w900,
                    color: AppColors.primaryColor,
                  ),
                  SizedBox(
                    height: sized.height(0.02),
                  ),
                  Content(
                    data: "49 Step Emotional Refinement\nProgram",
                    size: sized.height(0.02),
                    weight: FontWeight.w500,
                    color: AppColors.primaryColor,
                    alignment: TextAlign.center,
                  ),
                  Image.asset(
                    Images.logoTransparent,
                    height: sized.height(0.35),
                    color: AppColors.secondaryColor,
                    fit: BoxFit.cover,
                  ),
                  Content(
                    data: "ME365 counting started on\nThursday, April 06,2023",
                    size: sized.height(0.02),
                    weight: FontWeight.w500,
                    color: AppColors.primaryColor,
                    alignment: TextAlign.center,
                  ),
                  SizedBox(
                    height: sized.height(0.14),
                  ),
                ],
              ),
            ),
            Positioned(
                bottom: 1,
                right: 1,
                child: Container(
                  margin: EdgeInsets.only(right: 30, bottom: 30),
                  child: Row(
                    children: [
                      // Content(data: "Get Started", size: sized.height(0.032),color: AppColors.primaryColor,weight: FontWeight.w500,),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, RoutesName.welcome1);
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
                ))
            // Spacer(),
          ],
        ),
      )),
    );
  }
}
