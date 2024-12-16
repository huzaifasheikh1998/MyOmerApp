import 'package:flutter/material.dart';
import 'package:mvvm/res/color.dart';
import 'package:mvvm/res/components/text.dart';
import 'package:mvvm/res/components/week_widget.dart';
import 'package:mvvm/res/size.dart';

class DaysWeek extends StatelessWidget {
  String title;
  List list;
  List<DaysWeeksModel> list2;
  bool? blessing;
  DaysWeek(
      {super.key,
      required this.title,
      required this.list,
      required this.list2,
      this.blessing});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Sized(context).width(0.1),
      margin: EdgeInsets.only(top: 5),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
      child: Row(children: [
        SizedBox(
          width: 12,
        ),
        Content(
          data: title,
          size: 18,
          color: AppColors.primaryColor,
        ),
        SizedBox(
          width: 12,
        ),
        Expanded(
          child: ListView.builder(
              itemCount: list2.length,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final iteration = list2[index];
                return WeekWidget(
                  data: iteration.day.toString(),
                  color: AppColors.dayWeekColorList[index],
                  active: iteration.active,
                  blessing: blessing,
                  title: "title",
                  subtitle: "subtitle",
                  content: "Content",
                );
              }),
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
    );
  }
}

class DaysWeeksModel {
  final int day;
  final bool active;
  DaysWeeksModel({required this.day, required this.active});
}
