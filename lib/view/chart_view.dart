import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mvvm/main.dart';
import 'package:mvvm/repository/chart_repo.dart';
import 'package:mvvm/res/color.dart';
import 'package:mvvm/res/components/appbar2.dart';
import 'package:mvvm/res/components/chart_week.dart';
import 'package:mvvm/res/components/loader.dart';
import 'package:mvvm/res/components/text.dart';
import 'package:mvvm/res/images.dart';
import 'package:mvvm/res/size.dart';

class ChartView extends StatelessWidget {
  ChartView({super.key});
  ChartRepo chartRepo = ChartRepo();
  var body = {"user_id": loginId};
  @override
  Widget build(BuildContext context) {
    Sized sized = Sized(context);
    return Scaffold(
      appBar: MyAppBar2(title: "ME365"),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                padding: EdgeInsets.symmetric(
                    vertical: sized.height(0.03),
                    horizontal: sized.width(0.05)),
                decoration: BoxDecoration(
                    color: AppColors.lightGrey,
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          Images.chart,
                          height: 27,
                          color: AppColors.primaryColor,
                        ),
                        Content(
                          data: " ME365 Chart",
                          size: 20,
                          weight: FontWeight.w600,
                          color: AppColors.primaryColor,
                        ),
                      ],
                    ),
                    FutureBuilder(
                        future: chartRepo.fetchChartList(body),
                        builder: (context, snapshot) {
                          print(body);
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                SizedBox(
                                  height: sized.height(0.08),
                                ),
                                Loader(),
                                SizedBox(
                                  height: sized.height(0.08),
                                ),
                              ],
                            );
                          } else if (snapshot.error != null) {
                            return Content(
                                data: snapshot.error.toString(), size: 12);
                          } else if (snapshot.hasData) {
                            return ListView.builder(
                                shrinkWrap: true,
                                itemCount: chartRepo.chartList.length,
                                itemBuilder: (context, index) {
                                  final iteration = chartRepo.chartList[index];
                                  return ChartWeek(
                                    list: iteration.days!.toList(),
                                    week: iteration.week.toString(),
                                  );
                                });
                          } else {
                            return Container();
                          }
                        })
                    // SizedBox(
                    //   height: sized.height(0.014),
                    // ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: [
                    //     ChartWeek(list: [1, 2, 3, 4, 5, 6, 7], week: 1),
                    //   ],
                    // ),
                    // SizedBox(
                    //   height: 10,
                    // ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: [
                    //     ChartWeek(list: [8, 9, 10, 11, 12, 13, 14], week: 2),
                    //   ],
                    // ),
                    // SizedBox(
                    //   height: 10,
                    // ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: [
                    //     ChartWeek(list: [15, 16, 17, 18, 19, 20, 21], week: 3),
                    //   ],
                    // ),
                    // SizedBox(
                    //   height: 10,
                    // ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: [
                    //     ChartWeek(list: [22, 23, 24, 25, 26, 27, 28], week: 4),
                    //   ],
                    // ),
                    // SizedBox(
                    //   height: 10,
                    // ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: [
                    //     ChartWeek(list: [29, 30, 31, 32, 33, 34, 35], week: 5),
                    //   ],
                    // ),
                    // SizedBox(
                    //   height: 10,
                    // ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: [
                    //     ChartWeek(list: [36, 37, 38, 39, 40, 41, 42], week: 6),
                    //   ],
                    // ),
                    // SizedBox(
                    //   height: 10,
                    // ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: [
                    //     ChartWeek(list: [43, 44, 45, 46, 47, 48, 49], week: 7),
                    //   ],
                    // ),
                  ],
                )
                // DaysWeek(title: "Week 1", list: [1,2,3,4,5,6,7])

                )
          ],
        ),
      ),
    );
  }
}
