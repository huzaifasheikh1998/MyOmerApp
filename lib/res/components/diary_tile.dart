import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mvvm/res/color.dart';
import 'package:mvvm/res/components/text.dart';
import 'package:mvvm/res/size.dart';

class DiaryTile extends StatelessWidget {
  final String Date;
  final String content;
  const DiaryTile({super.key, required this.Date, required this.content});

  @override
  Widget build(BuildContext context) {
    Sized sized = Sized(context);
    return Container(
      width: sized.width(1) - sized.primaryMargin,
      padding: EdgeInsets.symmetric(
          vertical: sized.height(0.02), horizontal: sized.height(0.015)),
      decoration: BoxDecoration(
          color: AppColors.dayWeekColorList[1],
          borderRadius: BorderRadius.circular(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(right: sized.height(0.015)),
            width: 5,
            height: sized.height(0.03),
            decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(20)),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Content(
                data: Date,
                size: sized.height(0.02),
                color: AppColors.white,
                alignment: TextAlign.start,
              ),
              SizedBox(
                height: 5,
              ),

              Row(
                children: [
                  // Content(
                  //   data: "Outcome: ",
                  //   size: sized.height(0.017),
                  //   color: AppColors.white,
                  //   alignment: TextAlign.start,
                  // ),
                  Content(
                    data: content,
                    size: sized.height(0.02),
                    color: AppColors.white,
                    alignment: TextAlign.start,
                  ),
                ],
              ),

              // Row(
              //   children: [
              //     Content(
              //       data:
              //           "This is the decison we are taking about.\n This is the decison we are taking about. ",
              //       size: sized.height(0.018),
              //       color: AppColors.primaryColor,
              //     ),
              //   ],
              // )
            ],
          ),
        ],
      ),
    );
  }
}
