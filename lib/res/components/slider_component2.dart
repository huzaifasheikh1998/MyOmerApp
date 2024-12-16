import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mvvm/res/color.dart';
import 'package:mvvm/res/components/text.dart';
import 'package:mvvm/res/size.dart';
import 'package:mvvm/view_model/home_view_model.dart';
import 'package:provider/provider.dart';

class SliderComponent2 extends StatelessWidget {
  String title;
  // int initialValue;
  int intValue;
  String day;
  SliderComponent2(
      {super.key,
      required this.title,
      required this.intValue,
      required this.day});

  @override
  Widget build(BuildContext context) {
    Sized sized = Sized(context);

    return Consumer<HomeViewModel>(builder: (context, value, child) {
      return GestureDetector(
        onTap: () {
          value.setIndex2(intValue);
          // addVoice(context, title, day);
        },
        child: Container(
          padding: EdgeInsets.all(sized.width(0.03)),
          decoration: BoxDecoration(
            color: value.index2 == intValue
                ? AppColors.dayWeekColorList[4]
                : AppColors.transparent,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Content(
            data: title,
            size: sized.width(0.041),
            color: value.index2 == intValue
                ? AppColors.white
                : AppColors.secondaryColor,
          ),
        ),
      );
    });
  }
}
