import 'package:flutter/material.dart';
import 'package:mvvm/main.dart';
import 'package:mvvm/repository/home_repo.dart';
import 'package:mvvm/repository/token_repo.dart';
import 'package:mvvm/res/color.dart';
import 'package:mvvm/res/components/appbar.dart';
import 'package:mvvm/res/components/blessing_widget.dart';
import 'package:mvvm/res/components/days_weeks.dart';
import 'package:mvvm/res/components/home_slider.dart';
import 'package:mvvm/res/components/home_widget.dart';
import 'package:mvvm/res/components/text.dart';
import 'package:mvvm/res/size.dart';
import 'package:mvvm/view_model/home_view_model.dart';
import 'package:mvvm/view_model/journal_view_model.dart';
import 'package:provider/provider.dart';
import '../res/components/slider_component2.dart';
Map<dynamic, dynamic> basicBody = {"id": loginId};
List<DaysWeeksModel> daysList = [
  DaysWeeksModel(day: 1, active: true),
  DaysWeeksModel(day: 2, active: true),
  DaysWeeksModel(day: 3, active: true),
  DaysWeeksModel(day: 4, active: true),
  DaysWeeksModel(day: 5, active: false),
  DaysWeeksModel(day: 6, active: false),
  DaysWeeksModel(day: 7, active: false)
];

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
    JournalViewModel journalViewModel = JournalViewModel(); // for initialization of the Journal Page
  @override
  void initState() {
    final tokenRepo = TokenRepo();
    final homeViewModel = Provider.of<HomeViewModel>(context, listen: false);
    // HomeViewModel homeViewModel = HomeViewModel();
    homeViewModel.setInitial();
    tokenRepo.tokenApi({"user_id": loginId, "fcm_token": tokenId});
    super.initState();
        journalViewModel.getAllDiary(basicBody);
    journalViewModel.getAllEvent(basicBody);
    journalViewModel.getAllAftb(basicBody);
  }

  @override
  Widget build(BuildContext context) {
    Sized sized = Sized(context);
    final homeViewModel = Provider.of<HomeViewModel>(context, listen: true);
    HomeRepo homeRepo = HomeRepo();

    return Scaffold(
        appBar: MyAppBar(title: "title"),
        body: Container(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  margin: EdgeInsets.all(sized.primaryMargin),
                  child: HomeSlider()),
              homeViewModel.index == 0
                  ? DaysWeek(
                      title: "Days",
                      list: [1, 2, 3, 4, 5, 6, 7],
                      list2: daysList)
                  : homeViewModel.index == 1
                      ? DaysWeek(title: "Weeks", list: [
                          1,
                          2,
                          3,
                          4
                        ], list2: [
                          DaysWeeksModel(day: 1, active: true),
                          DaysWeeksModel(day: 2, active: true)
                        ])
                      : homeViewModel.index == 2
                          ? Container()
                          : homeViewModel.index == 3
                              ? Column(
                                  children: [
                                    DaysWeek(
                                      title: "Days",
                                      list: [1, 2, 3, 4, 5, 6, 7],
                                      list2: daysList,
                                      blessing: true,
                                    ),
                                    SizedBox(
                                      height: sized.primaryMargin * 1.5,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        SliderComponent2(
                                          title: "Humash",
                                          intValue: 0,
                                          day: "Day 23",
                                        ),
                                        SliderComponent2(
                                            title: "Tehilim",
                                            intValue: 1,
                                            day: "Day 23"),
                                        SliderComponent2(
                                            title: "Tanya",
                                            intValue: 2,
                                            day: "Day 23")
                                      ],
                                    )
                                  ],
                                )
                              : Container(),
              Expanded(
                // flex: 4,
                child:
                    Consumer<HomeViewModel>(builder: (context, value, child) {
                  return value.index == 0
                      ? FutureBuilder(
                          future: homeRepo.fetchDailyList(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return Column(
                                children: [
                                  Expanded(
                                    child: Center(
                                      child: CircularProgressIndicator(
                                        strokeWidth: 2,
                                        color: AppColors.primaryColor,
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            } else if (snapshot.hasData) {
                              return PageView.builder(
                                  itemCount: homeRepo.dailyList.length,
                                  itemBuilder: (context, index) {
                                    final iteration = homeRepo.dailyList[index];
                                    return HomeWidget(
                                        day: iteration.date.toString(),
                                        title: iteration.mainHeading.toString(),
                                        subTitle:
                                            iteration.subHeading.toString(),
                                        heading: iteration.title.toString(),
                                        content: iteration.content.toString());
                                    // HomeWidget();
                                  });
                            } else {
                              return Content(
                                  data: snapshot.error.toString(), size: 12);
                            }
                          })
                      : value.index == 1 //Weekly
                          ? FutureBuilder(
                              future: homeRepo.fetchWeeklyList(),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return Column(
                                    children: const [
                                      Expanded(
                                        child: Center(
                                          child: CircularProgressIndicator(
                                            strokeWidth: 2,
                                            color: AppColors.primaryColor,
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                } else if (snapshot.hasData) {
                                  return PageView.builder(
                                      itemCount: homeRepo.weeklyList.length,
                                      itemBuilder: (context, index) {
                                        final iteration =
                                            homeRepo.weeklyList[index];
                                        return HomeWidget(
                                            day: iteration.date.toString(),
                                            title: iteration.mainHeading
                                                .toString(),
                                            subTitle:
                                                iteration.subHeading.toString(),
                                            heading: iteration.title.toString(),
                                            content:
                                                iteration.content.toString());
                                        // HomeWidget();
                                      });
                                } else {
                                  return Content(
                                      data: snapshot.error.toString(),
                                      size: 12);
                                }
                              })
                          : value.index == 2 //Monthly
                              ? FutureBuilder(
                                  future: homeRepo.fetchMonthlyList(),
                                  builder: (context, snapshot) {
                                    if (snapshot.connectionState ==
                                        ConnectionState.waiting) {
                                      return Column(
                                        children: [
                                          Expanded(
                                            child: Center(
                                              child: CircularProgressIndicator(
                                                strokeWidth: 2,
                                                color: AppColors.primaryColor,
                                              ),
                                            ),
                                          ),
                                        ],
                                      );
                                    } else if (snapshot.hasData) {
                                      return PageView.builder(
                                          itemCount:
                                              homeRepo.monthlyList.length,
                                          itemBuilder: (context, index) {
                                            final iteration =
                                                homeRepo.monthlyList[index];
                                            return HomeWidget(
                                                day: iteration.date.toString(),
                                                title: iteration.mainHeading
                                                    .toString(),
                                                subTitle: iteration.subHeading
                                                    .toString(),
                                                heading:
                                                    iteration.title.toString(),
                                                content: iteration.content
                                                    .toString());
                                            // HomeWidget();
                                          });
                                    } else {
                                      return Content(
                                          data: snapshot.error.toString(),
                                          size: 12);
                                    }
                                  })
                              : value.index == 3 //Monthly
                                  ? FutureBuilder(
                                      future: homeRepo.fetchBlessingList(),
                                      builder: (context, snapshot) {
                                        if (snapshot.connectionState ==
                                            ConnectionState.waiting) {
                                          return Column(
                                            children: [
                                              Expanded(
                                                child: Center(
                                                  child:
                                                      CircularProgressIndicator(
                                                    strokeWidth: 2,
                                                    color:
                                                        AppColors.primaryColor,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          );
                                        } else if (snapshot.hasData) {
                                          var list =
                                              homeRepo.blessingHumashList;
                                          if (value.index2 == 0) {
                                            list = homeRepo.blessingHumashList;
                                          } else if (value.index2 == 1) {
                                            list = homeRepo.blessingTehilimList;
                                          } else if (value.index2 == 2) {
                                            list = homeRepo.blessingTanyaList;
                                          }
                                          return PageView.builder(
                                              itemCount: list.length,
                                              itemBuilder: (context, index) {
                                                final iteration = list[index];
                                                return BlessingWidget(
                                                    day: iteration.date
                                                        .toString(),
                                                    title: iteration.title
                                                        .toString(),
                                                    content: iteration.content
                                                        .toString());
                                                // HomeWidget();
                                              });
                                        } else {
                                          return Content(
                                              data: snapshot.error.toString(),
                                              size: 12);
                                        }
                                      })
                                  : PageView.builder(
                                      itemCount: 4,
                                      itemBuilder: (conterxt, index) {
                                        return Container();
                                        // HomeWidget();
                                      });
                }),
              ),
              //  Expanded(
              //     flex: 1,
              //     child: SizedBox(height: 1,)),
              SizedBox(
                height: 90,
              )
            ],
          ),
        ));
  }
}
