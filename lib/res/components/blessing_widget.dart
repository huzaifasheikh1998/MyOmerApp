import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mvvm/res/color.dart';
import 'package:mvvm/res/components/text.dart';
import 'package:mvvm/res/images.dart';
import 'package:mvvm/res/size.dart';
import 'package:mvvm/utils/utils.dart';

class BlessingWidget extends StatelessWidget {
  final String day;
  final String title;
  final String content;
  const BlessingWidget(
      {super.key,
      required this.day,
      required this.title,
      required this.content});

  @override
  Widget build(BuildContext context) {
    Sized sized = Sized(context);
    return Scrollbar(
      child: Container(
        margin: EdgeInsets.all(sized.primaryMargin),
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          child: Container(
            height: 300,

            padding: EdgeInsets.all(sized.height(0.034)),

            // padding: EdgeInsets.only(
            //     top: sized.height(0.034), left: sized.height(0.034)),
            decoration: BoxDecoration(
                color: AppColors.thirdColor,
                borderRadius: BorderRadius.circular(30)),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Content(
                            data:
                                "Date " + Utils.dateFormat(DateTime.parse(day)),
                            size: sized.height(0.024),
                            weight: FontWeight.bold,
                            color: AppColors.primaryColor,
                          ),
                          GestureDetector(
                            onTap: () {
                              Utils().shareText("Day $day\n$title\n$content");
                            },
                            child: Image.asset(
                              Images.share,
                              height: sized.height(0.04),
                              color: AppColors.secondaryColor,
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: sized.height(.013),
                      ),
                      Content(
                        data: title,
                        size: 15,
                        weight: FontWeight.bold,
                        color: AppColors.primaryColor,
                        alignment: TextAlign.start,
                      ),
                    ],
                  ),
                  // SizedBox(
                  //   height: sized.height(0.02),
                  // ),
                  // Content(
                  //   data: "Day 23",
                  //   size: sized.height(0.03),
                  //   weight: FontWeight.bold,
                  //   color: AppColors.primaryColor,
                  // ),
                  // SizedBox(
                  //   height: sized.height(.013),
                  // ),
                  // Content(
                  //   data: "Netzach of Netzach\nEndurance in Endurance",
                  //   size: 15,
                  //   weight: FontWeight.bold,
                  //   color: AppColors.primaryColor,
                  //   alignment: TextAlign.center,
                  // ),
                  // SizedBox(
                  //   height: sized.height(0.02),
                  // ),
                  SizedBox(
                    height: sized.height(0.02),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: AppColors.thirdColor,
                        borderRadius: BorderRadius.circular(30)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        //  Content(data: "Day 23", size: 18,weight: FontWeight.bold,color: AppColors.primaryColor,),
                        //  SizedBox(height: sized.height(.013),),
                        //  Content(data: "Netzach of Netzach\nEndurance in Endurance", size: 15,weight: FontWeight.bold,color: AppColors.primaryColor,),
                        //  SizedBox(height: sized.height(.013),),
                        // Content(
                        //   data: "Meditation:",
                        //   size: sized.height(0.024),
                        //   weight: FontWeight.bold,
                        //   color: AppColors.primaryColor,
                        // ),
                        // SizedBox(
                        //   height: sized.height(0.02),
                        // ),
                        Content(
                          data: content,
                          size: 15,
                          // weight: FontWeight.bold,
                          color: AppColors.primaryColor,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            SizedBox(
                              height: 30,
                            ),
                            Icon(
                              Icons.copyright_sharp,
                              size: 15,
                              color: AppColors.primaryColor,
                            ),
                            Content(
                              data:
                                  " Copyright Kehot Publication Society, Brooklyn NYC",
                              size: 11,
                              weight: FontWeight.bold,
                              color: AppColors.primaryColor,
                            ),
                          ],
                        ),
                        //  SizedBox(height: sized.height(0.02),),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
