import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mvvm/res/color.dart';
import 'package:mvvm/res/components/text.dart';
import 'package:mvvm/res/images.dart';
import 'package:mvvm/res/size.dart';
import 'package:mvvm/view/video_player.dart';

class VideoWidget extends StatelessWidget {
  final String day;
  final String title;
  final String subTitle;
  final String heading;
  final String content;
  final String link;

  const VideoWidget(
      {super.key,
      required this.day,
      required this.title,
      required this.subTitle,
      required this.heading,
      required this.content,
      required this.link});

  @override
  Widget build(BuildContext context) {
    Sized sized = Sized(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          child: Container(
            // padding: EdgeInsets.all(sized.height(0.03)),
            decoration: BoxDecoration(
                color: AppColors.secondaryColor,
                borderRadius: BorderRadius.circular(30)),
            child: Column(
              children: [
                SizedBox(
                  height: sized.height(0.02),
                ),
                Content(
                  data: "Day $day",
                  size: sized.height(0.03),
                  weight: FontWeight.bold,
                  color: AppColors.lightGrey,
                ),
                SizedBox(
                  height: sized.height(.013),
                ),
                Content(
                  data: title,
                  size: 15,
                  weight: FontWeight.bold,
                  color: AppColors.lightGrey,
                  alignment: TextAlign.center,
                ),
                Content(
                  data: subTitle,
                  size: 15,
                  weight: FontWeight.bold,
                  color: AppColors.lightGrey,
                  alignment: TextAlign.center,
                ),
                SizedBox(
                  height: sized.height(0.02),
                ),
                Container(
                  padding: EdgeInsets.all(sized.height(0.034)),
                  decoration: BoxDecoration(
                      color: AppColors.lightGrey,
                      borderRadius: BorderRadius.circular(30)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      //  Content(data: "Day 23", size: 18,weight: FontWeight.bold,color: AppColors.secondaryColor,),
                      //  SizedBox(height: sized.height(.013),),
                      //  Content(data: "Netzach of Netzach\nEndurance in Endurance", size: 15,weight: FontWeight.bold,color: AppColors.secondaryColor,),
                      //  SizedBox(height: sized.height(.013),),
                      Content(
                        data: heading,
                        size: sized.height(0.024),
                        weight: FontWeight.bold,
                        color: AppColors.primaryColor,
                      ),
                      SizedBox(
                        height: sized.height(0.02),
                      ),
                      GestureDetector(
                        onTap: () {
                          // print(link);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      MyVideoPlayerFromURlScreen(url: link)
                                  // VideoFromUrl(url: link)
                                  ));
                        },
                        child: Center(
                            child: Image.asset(
                          Images.video2,
                          color: AppColors.primaryColor,
                          height: sized.height(.13),
                        )),
                      ),
                      SizedBox(
                        height: sized.height(0.02),
                      ),
                      Content(
                        data: content,
                        size: 15,
                        color: AppColors.primaryColor,
                      ),
                      //  SizedBox(height: sized.height(0.02),),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 110,
        )
      ],
    );
  }
}
