import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mvvm/main.dart';
import 'package:mvvm/repository/exercise_repo.dart';
import 'package:mvvm/res/color.dart';
import 'package:mvvm/res/components/text.dart';
import 'package:mvvm/res/images.dart';
import 'package:mvvm/res/size.dart';
import 'package:mvvm/view_model/exercise_view_model.dart';
import 'package:mvvm/view_model/exercise_widget_view_model.dart';
import 'package:provider/provider.dart';

class ExerciseWidget extends StatelessWidget {
  final int index;
  final String day;
  final String title;
  final String subtitle;
  final String content;
  final iteration;

  ExerciseWidget(
      {super.key,
      required this.index,
      required this.day,
      required this.title,
      required this.subtitle,
      required this.content,
      required this.iteration});

  @override
  Widget build(BuildContext context) {
    Sized sized = Sized(context);
    ExerciseRepo exerciseRepo = ExerciseRepo();
    ExerciseViewModel exerciseViewModel =
        Provider.of<ExerciseViewModel>(context, listen: false);
    print("${exerciseEmotionalList[index].isNotify.toString()} is notify");
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          // margin: EdgeInsets.all(sized.primaryMargin),
          child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            child: Column(
              children: [
                // SizedBox(
                //   height: sized.height(.01),
                // ),
                Container(
                  decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(30)),
                  child: Column(
                    children: [
                      // SizedBox(
                      //   height: sized.height(0.02),
                      // ),
                      Container(
                         padding: EdgeInsets.all(sized.height(0.02)),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: sized.height(0.045),
                                ),
                                Content(
                                  data: "Day $day",
                                  size: sized.height(0.03),
                                  weight: FontWeight.bold,
                                  color: AppColors.thirdColor,
                                ),
                                Consumer<ExerciseWidgetViewModel>(
                                    builder: (context, value, child) {
                                  print("build");
                                  print(exerciseViewModel.index);
                                  return GestureDetector(
                                    onTap: () {
                                      String e_id = iteration.id.toString();
                                      Map body = {"id": loginId, "e_id": e_id};
                                      value.setNotification(exerciseViewModel.index,
                                          body, iteration.isNotify.toString(), index);
                                      // print("$index");
                                      // print(iteration.isNotify);
                                      // String status = iteration
                                      //     .isNotify
                                      //     .toString();
                                      // if (status == "0") {
                                      //   exerciseEmotionalList[index].isNotify = "1";
                                      // } else {
                                      //   exerciseEmotionalList[index].isNotify = "0";
                                      // }
                                      // print(
                                      //     "${exerciseEmotionalList[index].isNotify} changed value");
                                      //  exerciseEmotionalList[index].isNotify =
                                      //    exerciseEmotionalList[index].isNotify!;
                                      //  value.setNotification(!value.notification);
                                    },
                                    child: Container(
                                        height: sized.height(0.045),
                                        margin: EdgeInsets.only(right: 5),
                                        padding: EdgeInsets.all(6),
                                        decoration: BoxDecoration(
                                          color: exerciseViewModel.index == 0
                                              ? exerciseEmotionalList[index]
                                                          .isNotify
                                                          .toString() ==
                                                      "1"
                                                  ? AppColors.secondaryColor
                                                  : AppColors.transparent
                                              : exerciseViewModel.index == 1
                                                  ? exerciseBusinessList[index]
                                                              .isNotify
                                                              .toString() ==
                                                          "1"
                                                      ? AppColors.secondaryColor
                                                      : AppColors.transparent
                                                  : exerciseViewModel.index == 2
                                                      ? exerciseRelationshipList[
                                                                      index]
                                                                  .isNotify
                                                                  .toString() ==
                                                              "1"
                                                          ? AppColors.secondaryColor
                                                          : AppColors.transparent
                                                      : Colors.transparent,
                                          shape: BoxShape.circle,
                                        ),
                                        child: Image.asset(
                                          Images.noti,
                                          height: sized.height(0.038),
                                          color: exerciseViewModel.index == 0
                                              ? exerciseEmotionalList[index]
                                                          .isNotify
                                                          .toString() ==
                                                      "1"
                                                  ? AppColors.white
                                                  : AppColors.secondaryColor
                                              : exerciseViewModel.index == 1
                                                  ? exerciseBusinessList[index]
                                                              .isNotify
                                                              .toString() ==
                                                          "1"
                                                      ? AppColors.white
                                                      : AppColors.secondaryColor
                                                  : exerciseViewModel.index == 2
                                                      ? exerciseRelationshipList[
                                                                      index]
                                                                  .isNotify
                                                                  .toString() ==
                                                              "1"
                                                          ? AppColors.white
                                                          : AppColors.secondaryColor
                                                      : Colors.transparent,
                                        )),
                                  );
                                }),
                              ],
                            ),
                        
                      SizedBox(
                        height: sized.height(.013),
                      ),
                      Content(
                        data: title,
                        size: 15,
                        weight: FontWeight.bold,
                        color: AppColors.thirdColor,
                        alignment: TextAlign.center,
                      ),
                      Content(
                        data: subtitle,
                        size: 15,
                        weight: FontWeight.bold,
                        color: AppColors.thirdColor,
                        alignment: TextAlign.center,
                      ),  ],
                        ),
                      ),
                      // SizedBox(
                      //   height: sized.height(.013),
                      // ),

                      // Image.asset(
                      //   Images.logoTransparent,
                      //   color: AppColors.secondaryColor,
                      // ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Container(
                              height: sized.height(0.35),
                               padding: EdgeInsets.all(sized.height(0.03)),
                                decoration: BoxDecoration(
                            color: AppColors.greyColor,
                            borderRadius: BorderRadius.circular(30)),
                              child: SingleChildScrollView(
                                child: Content(
                                  data: content,
                                  size: 15,
                                  weight: FontWeight.bold,
                                  color: AppColors.primaryColor,
                                  alignment: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      // SizedBox(
                      //   height: sized.height(.013),
                      // ),
                      //
                      //  SizedBox(height: size.height(.013),),
                      // Content(
                      //   data: "Meditation:",
                      //   size: sized.height(0.024),
                      //   weight: FontWeight.bold,
                      //   color: AppColors.primaryColor,
                      // ),
                      // SizedBox(
                      //   height: sized.height(0.02),
                      // ),
                      // Content(
                      //   data:
                      //       "Different devices can have a wide range of screen heights, and assuming a fixed layout height may not work well for all of them. Additionally, other factors such as font sizes, margins, and padding may also need to be adjusted for responsive design.",
                      //   size: 15,
                      //   weight: FontWeight.bold,
                      //   color: AppColors.primaryColor,
                      // ),
                      //  SizedBox(height: size.height(0.02),),
                    ],
                  ),
                )
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
