import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mvvm/res/color.dart';
import 'package:mvvm/res/components/text.dart';
import 'package:mvvm/res/size.dart';
import 'package:mvvm/view_model/home_view_model.dart';
import 'package:provider/provider.dart';

class HomeSlider extends StatelessWidget {
  const HomeSlider({super.key});

  @override
  Widget build(BuildContext context) {
    Sized sized = Sized(context);
    return Consumer<HomeViewModel>(builder: (context, value, child) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              value.setIndex(0);
            },
            child: Container(
              padding: EdgeInsets.all(sized.width(0.03)),
              decoration: BoxDecoration(
                color: value.index == 0
                    ? AppColors.secondaryColor
                    : AppColors.transparent,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Content(
                data: "Daily",
                size: sized.width(0.041),
                color:
                    value.index == 0 ? AppColors.white : AppColors.primaryColor,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              value.setIndex(1);
            },
            child: Container(
              padding: EdgeInsets.all(sized.width(0.03)),
              decoration: BoxDecoration(
                color: value.index == 1
                    ? AppColors.secondaryColor
                    : AppColors.transparent,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Content(
                data: "Weekly",
                size: sized.width(0.041),
                color:
                    value.index == 1 ? AppColors.white : AppColors.primaryColor,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              value.setIndex(2);
            },
            child: Container(
              padding: EdgeInsets.all(sized.width(0.03)),
              decoration: BoxDecoration(
                color: value.index == 2
                    ? AppColors.secondaryColor
                    : AppColors.transparent,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Content(
                data: "Monthly",
                size: sized.width(0.041),
                color:
                    value.index == 2 ? AppColors.white : AppColors.primaryColor,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              value.setIndex(3);
            },
            child: Container(
              padding: EdgeInsets.all(sized.width(0.03)),
              decoration: BoxDecoration(
                color: value.index == 3
                    ? AppColors.secondaryColor
                    : AppColors.transparent,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Content(
                data: "Blessing",
                size: sized.width(0.041),
                color:
                    value.index == 3 ? AppColors.white : AppColors.primaryColor,
              ),
            ),
          ),
        ],
      );
    });
  }
}
