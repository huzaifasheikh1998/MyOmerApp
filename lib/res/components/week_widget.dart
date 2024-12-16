import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mvvm/res/color.dart';
import 'package:mvvm/res/components/home_alert.dart';
import 'package:mvvm/res/components/text.dart';
import 'package:mvvm/res/size.dart';

class WeekWidget extends StatelessWidget {
  String data;
  Color color;
  bool active;
  bool? blessing;
  final String title;
  final String subtitle;
  final String content;
  WeekWidget(
      {super.key,
      required this.data,
      required this.color,
      required this.active,
      this.blessing,
      required this.title,
      required this.subtitle,
      required this.content});

  @override
  Widget build(BuildContext context) {
    Sized sized = Sized(context);
    return GestureDetector(
      onTap: () {
        // print(blessing);
        if (active) {
          if (blessing != null) {
            if (blessing == true) {
              // print("blessing true");
              return;
            }
          } else {
            homeAlert(context, title, subtitle, content);
          }
        }
        // active ?blessing != null? homeAlert(context) : null;
      },
      child: Container(
        height: sized.width(0.1),
        width: sized.width(0.1),
        margin: EdgeInsets.only(right: sized.width(0.01)),
        // padding: EdgeInsets.all(sized.width(0.02)),
        decoration: BoxDecoration(
            color: active ? color : AppColors.greyColor,
            //  color,
            borderRadius: BorderRadius.circular(12)),
        child: Center(
            child: Content(
          data: data,
          size: 18,
          color: active ? AppColors.primaryColor : AppColors.white,
          alignment: TextAlign.center,
        )),
      ),
    );
  }
}
