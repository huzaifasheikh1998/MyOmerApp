import 'package:flutter/material.dart';
import 'package:mvvm/res/color.dart';
import 'package:mvvm/res/components/text.dart';
import 'package:mvvm/res/components/week_widget.dart';
import 'package:mvvm/res/size.dart';
import 'package:mvvm/utils/utils.dart';

class ChartWeek extends StatelessWidget {
  List list;
  String week;
  ChartWeek({super.key, required this.list, required this.week});

  @override
  Widget build(BuildContext context) {
    Sized sized = Sized(context);
    print(week);
    print(list);
    return Column(
      children: [
        SizedBox(
          height: sized.height(0.014),
        ),
        Row(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: Sized(context).width(0.1) + 32,
              margin: EdgeInsets.only(bottom: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // SizedBox(
                    //   width: 12,
                    // ),
                    Content(
                      data: "Week $week",
                      size: 18,
                      color: AppColors.primaryColor,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      // height:Sized(context).width(0.1),
                      child: Expanded(
                        child: ListView.builder(
                            itemCount: list.length,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              final iteration = list[index];
                              return WeekWidget(
                                data: iteration.number.toString(),
                                // color: AppColors.dayWeekColorList[week - 1],
                                color: AppColors.dayWeekColorList[
                                    Utils.intFormat(week) % 7 - 1],
                                active: iteration.active.toString() == "0"
                                    ? true
                                    : true,
                                title: iteration.mainHeading.toString(),
                                subtitle: iteration.subHeading.toString(),
                                content: iteration.content.toString(),
                              );
                            }),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    )
                    // Row(
                    //   children: [
                    //     WeekWidget(
                    //       data: "1",
                    //     ),
                    //     WeekWidget(
                    //       data: "2",
                    //     ),
                    //     WeekWidget(
                    //       data: "3",
                    //     ),
                    //     WeekWidget(
                    //       data: "4",
                    //     ),
                    //     WeekWidget(
                    //       data: "5",
                    //     ),
                    //     WeekWidget(
                    //       data: "6",
                    //     ),
                    //     WeekWidget(
                    //       data: "7",
                    //     ),
                    //   ],
                    // )
                  ]),
            ),
          ],
        ),
      ],
    );
  }
}
