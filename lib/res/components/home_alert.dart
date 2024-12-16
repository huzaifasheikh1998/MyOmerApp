import 'package:flutter/material.dart';
import 'package:mvvm/res/color.dart';
import 'package:mvvm/res/components/text.dart';
import 'package:mvvm/res/images.dart';
import 'package:mvvm/res/size.dart';
import 'package:mvvm/utils/utils.dart';

void homeAlert(
  BuildContext context,
  String title,
  String subtitle,
  String content,
) {
  Sized sized = Sized(context);
  showGeneralDialog(
    context: context,
    barrierLabel: "Barrier",
    barrierDismissible: true,
    barrierColor: Colors.black.withOpacity(0.5),
    transitionDuration: Duration(milliseconds: 450),
    transitionBuilder: (_, anim, __, child) {
      final tween = Tween(begin: Offset(0, 1), end: Offset.zero)
          .chain(CurveTween(curve: Curves.easeInQuad));
      // Tween<Offset> tween;
      // if (anim.status == AnimationStatus.reverse) {
      //   tween = Tween(begin: Offset(0, 1), end: Offset.zero);
      // } else {
      //   tween = Tween(begin: Offset(0, 1), end: Offset.zero);
      // }

      return SlideTransition(
        position: tween.animate(anim),
        child:
            //  SliverFadeTransition(
            //   opacity: anim,
            //   sliver: child,
            // )
            FadeTransition(
          opacity: anim,
          child: child,
        ),
      );
    },
    pageBuilder: (_, __, ___) {
      return Center(
        child: Material(
          color: AppColors.transparent,
          child: Container(
            // width: sized.width(0.95),
            margin: EdgeInsets.symmetric(horizontal: sized.width(0.023)),
            padding: EdgeInsets.symmetric(
                vertical: sized.height(0.03), horizontal: sized.height(0.03)),
            decoration: BoxDecoration(
                color: AppColors.thirdColor,
                borderRadius: BorderRadius.circular(30)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        // mainAxisSize: MainAxisSize.max,
                        children: [
                          Content(
                            data: title,
                            size: sized.height(0.03),
                            weight: FontWeight.bold,
                            color: AppColors.primaryColor,
                          ),
                          GestureDetector(
                            onTap: () {
                              Utils().shareText("$title\n$subtitle\n$content");
                            },
                            child: Image.asset(
                              Images.share,
                              height: sized.height(0.03),
                              color: AppColors.secondaryColor,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: sized.height(.013),
                ),
                Content(
                  data: subtitle,
                  size: 15,
                  weight: FontWeight.bold,
                  color: AppColors.primaryColor,
                  alignment: TextAlign.start,
                ),
                SizedBox(
                  height: sized.height(.013),
                ),
                Content(
                  data: content,
                  size: 15,
                  color: AppColors.primaryColor,
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
