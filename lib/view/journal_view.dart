import 'package:flutter/material.dart';
import 'package:mvvm/main.dart';
import 'package:mvvm/model/aftb_notes_model/aftb_notes_model.dart';
import 'package:mvvm/model/dairy_model/dairy_model.dart';
import 'package:mvvm/model/reminder_model/reminder_model.dart';
import 'package:mvvm/repository/journal_repo.dart';
import 'package:mvvm/res/color.dart';
import 'package:mvvm/res/components/aftb_tile.dart';
import 'package:mvvm/res/components/decision_tile.dart';
import 'package:mvvm/res/components/diary_tile.dart';
import 'package:mvvm/utils/utils.dart';
import 'package:mvvm/view/add_decision_view.dart';
import 'package:mvvm/res/components/appbar.dart';
import 'package:mvvm/res/size.dart';
import 'package:mvvm/view/add_diary_view.dart';
import 'package:mvvm/view/add_situation_view.dart';
import 'package:mvvm/view_model/journal_view_model.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';
import '../model/diary_note_mpdel/diary_note_model.dart';
import '../res/components/slider_component.dart';


late Map<DateTime, List<Reminder>> selectedEvent;
late Map<DateTime, List<AftbNotesModel>> aftbNotes;
late Map<DateTime, List<DiaryNoteModel>> diaryNotes;

class JournalView extends StatefulWidget {
  const JournalView({super.key});

  @override
  State<JournalView> createState() => _JournalViewState();
}

class _JournalViewState extends State<JournalView> {
  // late Map<DateTime, List<Event>> selectedEvent;
  late TextEditingController _dairyController;
  DateTime selectDay = DateTime.now();
  DateTime focusDay = DateTime.now();
  JournalRepo journalRepo = JournalRepo();
  JournalViewModel journalViewModel = JournalViewModel();
  // late Future<List<DairyModel>> _dairyData;
  // late Future<List<DecisionModel>> _decisionData;

  List<Reminder> getEventsfromDate(DateTime date) {
    return selectedEvent[date] ?? [];
  }

  List<AftbNotesModel> getAftbfromDate(DateTime date) {
    return aftbNotes[date] ?? [];
  }

  List<DiaryNoteModel> getDiaryfromDate(DateTime date) {
    return diaryNotes[date] ?? [];
  }

  @override
  void initState() {
    _dairyController = TextEditingController();
    Map<dynamic, dynamic> body = {"id": loginId};
    // print("<<<<<<<<<<<<<<$body>>>>>>>>>>>>>>");
    // _dairyData = journalRepo.fetchDairyList(body);
    journalViewModel.getAllDiary(body);
    journalViewModel.getAllEvent(body);
    journalViewModel.getAllAftb(body);

    super.initState();
  }

  @override
  void dispose() {
    _dairyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Sized sized = Sized(context);
    final journalViewModel =
        Provider.of<JournalViewModel>(context, listen: false);

    return Scaffold(
      appBar: MyAppBar(title: "Journal"),
      body: SingleChildScrollView(
        child: Container(
          // height: sized.screenHeight,
          margin: EdgeInsets.all(sized.primaryMargin),
          child: Column(
            children: [
              Consumer<JournalViewModel>(builder: (context, value, child) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SliderComponent(
                      title: "Diary",
                      initialValue: 0,
                      value: value.index,
                      viewModel: journalViewModel,
                    ),
                    SliderComponent(
                      title: "Decision",
                      initialValue: 1,
                      value: value.index,
                      viewModel: journalViewModel,
                    ),
                    SliderComponent(
                      title: "All for the Best",
                      initialValue: 2,
                      value: value.index,
                      viewModel: journalViewModel,
                    ),
                  ],
                );
              }),
              SizedBox(
                height: sized.height(.02),
              ),
              Consumer<JournalViewModel>(builder: (context, value, child) {
                print("Consumer build >>>>>>>>>>>>>>>>>>>");
                return value.index == 1
                    ? Column(
                        children: [
                          Stack(
                            children: [
                              TableCalendar(
                                firstDay: DateTime.utc(2022, 10, 16),
                                lastDay: DateTime.utc(2030, 3, 14),
                                focusedDay: focusDay,
                                onDaySelected: (selectedDay, focusedDay) {
                                  setState(() {
                                    selectDay = selectedDay;
                                    focusDay = focusedDay;
                                  });
                                },
                                selectedDayPredicate: (day) {
                                  return isSameDay(selectDay, day);
                                },
                                eventLoader: getEventsfromDate,
                                calendarStyle: CalendarStyle(
                                  isTodayHighlighted: true,
                                  selectedDecoration: BoxDecoration(
                                      color: AppColors.secondaryColor,
                                      shape: BoxShape.circle),
                                  todayDecoration: BoxDecoration(
                                      color: AppColors.dayWeekColorList[1],
                                      shape: BoxShape.circle),
                                ),
                                headerStyle: HeaderStyle(
                                    formatButtonVisible: false,
                                    titleCentered: true),
                              ),
                              Positioned(
                                  top: 12,
                                  right: 60,
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  AddDecisionView(
                                                      dateTime: selectDay)));
                                    },
                                    child: Container(
                                      padding: EdgeInsets.all(3),
                                      decoration: BoxDecoration(
                                        color: AppColors.secondaryColor,
                                        shape: BoxShape.circle,
                                      ),
                                      child: Icon(
                                        Icons.add,
                                        size: sized.height(0.04),
                                        color: Colors.white,
                                      ),
                                    ),
                                  )),
                            ],
                          ),
                          ListView.builder(
                            shrinkWrap: true,
                            itemCount: getEventsfromDate(selectDay).length,
                            itemBuilder: (BuildContext context, int index) {
                              Reminder reminder =
                                  getEventsfromDate(selectDay)[index];
                              return DecisionTile(
                                Date: Utils.dateFormat(selectDay).toString(),
                                content: reminder.title,
                              );
                            },
                          ),
                          // ...getEventsfromDate(selectDay).map(
                          //   (Event event) => DecisionTile(
                          //       Date: selectDay.toString(),
                          //       content: event.title),
                          // ),
                          // GestureDetector(
                          //     onTap: () {
                          //       // value.getAllEvent(basicBody);
                          //       // print("Selected Date $selectDay");
                          //       // if (selectedEvent[selectDay] != null) {
                          //       //   // if event already present
                          //       //   print("title");
                          //       //   selectedEvent[selectDay]!
                          //       //       .add(Reminder(title: "title"));
                          //       // } else {
                          //       //   print("sss");
                          //       //   selectedEvent[selectDay] = [
                          //       //     Reminder(title: "sss")
                          //       //   ];
                          //       // }
                          //       // setState(() {});
                          //       // print(selectedEvent);
                          //     },
                          //     child: DecisionTile(
                          //         Date: "Date", content: "content"))
                        ],
                      )
                    // Container(
                    // child:
                    //  TableCalendar(
                    //   selectedDayPredicate: (day) {
                    //     return isSameDay(_selectedDay, day);
                    //   },
                    //   onDaySelected: (selectedDay, focusedDay) {
                    //     setState(() {
                    //       _selectedDay = selectedDay;
                    //       _focusedDay =
                    //           focusedDay; // update `_focusedDay` here as well
                    //     });
                    //   },
                    // selectedDayPredicate: (day) {
                    //   print("selected date");
                    //   DateTime.utc(2030, 3, 14);
                    //   return ;
                    // },
                    // firstDay: DateTime.utc(2022, 10, 16),
                    // lastDay: DateTime.utc(2030, 3, 14),
                    // focusedDay: DateTime.now(),
                    // onDaySelected: (selectedDay, focusedDay) {
                    //   setState(() {
                    //     _selectedDay = selectedDay;
                    //     _focusedDay =
                    //         focusedDay; // update `_focusedDay` here as well
                    //   });

                    // eventLoader: (day) {
                    //   if (day.weekday == DateTime.monday) {
                    //     return [
                    //       Event('Cyclic event')];
                    //   }

                    //   return [];
                    // },
                    // ),
                    //          TableCalendar(
                    //   calendarController: _calendarController,
                    //   onDaySelected: (date, events, holidays) {
                    //     // Navigate to reminders view for selected date
                    //   },
                    // ),
                    // )
                    : value.index == 2
                        ? Column(
                            children: [
                              Stack(
                                children: [
                                  TableCalendar(
                                    firstDay: DateTime.utc(2022, 10, 16),
                                    lastDay: DateTime.utc(2030, 3, 14),
                                    focusedDay: focusDay,
                                    onDaySelected: (selectedDay, focusedDay) {
                                      // print("selected date $selectedDay");
                                      // print("focusday $focusedDay");
                                      setState(() {
                                        selectDay = selectedDay;
                                        focusDay = focusedDay;
                                      });
                                    },
                                    selectedDayPredicate: (day) {
                                      return isSameDay(selectDay, day);
                                    },
                                    eventLoader: getAftbfromDate,
                                    calendarStyle: CalendarStyle(
                                      isTodayHighlighted: true,
                                      selectedDecoration: const BoxDecoration(
                                          color: AppColors.secondaryColor,
                                          shape: BoxShape.circle),
                                      todayDecoration: BoxDecoration(
                                          color: AppColors.dayWeekColorList[1],
                                          shape: BoxShape.circle),
                                    ),
                                    headerStyle: HeaderStyle(
                                        formatButtonVisible: false,
                                        titleCentered: true),

                                    // calendarBuilders: _calendarController,

                                    // eventLoader: _events,
                                    // onDaySelected: _onDaySelected,
                                  ),
                                  Positioned(
                                      top: 12,
                                      right: 60,
                                      child: GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      AddSituationView(
                                                          dateTime:
                                                              selectDay)));
                                          // addDecisionAlert(context,selectDay,_eventController);
                                        },
                                        child: Container(
                                          padding: EdgeInsets.all(3),
                                          decoration: BoxDecoration(
                                            color: AppColors.secondaryColor,
                                            shape: BoxShape.circle,
                                          ),
                                          child: Icon(
                                            Icons.add,
                                            size: sized.height(0.04),
                                            color: Colors.white,
                                          ),
                                        ),
                                      )),
                                ],
                              ),
                              ListView.builder(
                                shrinkWrap: true,
                                itemCount: getAftbfromDate(selectDay).length,
                                itemBuilder: (BuildContext context, int index) {
                                  AftbNotesModel aftb =
                                      getAftbfromDate(selectDay)[index];
                                  return AftbTile(
                                    Date:
                                        Utils.dateFormat(selectDay).toString(),
                                    title: aftb.title,
                                    content: aftb.content,
                                  );
                                },
                              ),
                            ],
                          )
                        : value.index == 0
                            ? Column(
                                children: [
                                  Stack(
                                    children: [
                                      TableCalendar(
                                        firstDay: DateTime.utc(2022, 10, 16),
                                        lastDay: DateTime.utc(2030, 3, 14),
                                        focusedDay: focusDay,
                                        onDaySelected:
                                            (selectedDay, focusedDay) {
                                          // print("selected date $selectedDay");
                                          // print("focusday $focusedDay");
                                          setState(() {
                                            selectDay = selectedDay;
                                            focusDay = focusedDay;
                                          });
                                        },
                                        selectedDayPredicate: (day) {
                                          return isSameDay(selectDay, day);
                                        },
                                        eventLoader: getDiaryfromDate,
                                        calendarStyle: CalendarStyle(
                                          isTodayHighlighted: true,
                                          selectedDecoration:
                                              const BoxDecoration(
                                                  color:
                                                      AppColors.secondaryColor,
                                                  shape: BoxShape.circle),
                                          todayDecoration: BoxDecoration(
                                              color:
                                                  AppColors.dayWeekColorList[1],
                                              shape: BoxShape.circle),
                                        ),
                                        headerStyle: HeaderStyle(
                                            formatButtonVisible: false,
                                            titleCentered: true),

                                        // calendarBuilders: _calendarController,

                                        // eventLoader: _events,
                                        // onDaySelected: _onDaySelected,
                                      ),
                                      Positioned(
                                          top: 12,
                                          right: 60,
                                          child: GestureDetector(
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          AddDiaryView(
                                                              dateTime:
                                                                  selectDay)));
                                              // addDecisionAlert(context,selectDay,_eventController);
                                            },
                                            child: Container(
                                              padding: EdgeInsets.all(3),
                                              decoration: BoxDecoration(
                                                color: AppColors.secondaryColor,
                                                shape: BoxShape.circle,
                                              ),
                                              child: Icon(
                                                Icons.add,
                                                size: sized.height(0.04),
                                                color: Colors.white,
                                              ),
                                            ),
                                          )),
                                    ],
                                  ),
                                  ListView.builder(
                                    shrinkWrap: true,
                                    itemCount:
                                        getDiaryfromDate(selectDay).length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      DiaryNoteModel diary =
                                          getDiaryfromDate(selectDay)[index];
                                      return DiaryTile(
                                        Date: Utils.dateFormat(selectDay)
                                            .toString(),
                                        content: diary.title,
                                      );
                                    },
                                  ),
                                ],
                              )
                            : Container();

                // Container(
                //   // color: Colors.amber,
                //   height: sized.height(0.7),
                //   child: Column(
                //     children: [
                //       Expanded(
                //         child: FutureBuilder(
                //             future: _dairyData,
                //             // journalRepo
                //             // .fetchDairyList({"id": "1"}),
                //             builder: (context, snapshot) {
                //               if (snapshot.connectionState ==
                //                   ConnectionState.waiting) {
                //                 return const Center(
                //                   child: CircularProgressIndicator(
                //                     color: AppColors.primaryColor,
                //                     strokeWidth: 3,
                //                   ),
                //                 );
                //               } else if (snapshot.hasError) {
                //                 return Content(
                //                     data: snapshot.error.toString(),
                //                     size: 12);
                //               } else if (snapshot.hasData) {
                //                 return PageView.builder(
                //                     onPageChanged: (index) {
                //                       _dairyController.clear();
                //                     },
                //                     itemCount: journalRepo
                //                         .dairyList.length,
                //                     itemBuilder: (context, index) {
                //                       final iteration = journalRepo
                //                           .dairyList[index];
                //                       return JournalWidget(
                //                           day: iteration.day
                //                               .toString(),
                //                           heading: iteration.comment
                //                               .toString(),
                //                           dairyController:
                //                               _dairyController);
                //                     });
                //               } else {
                //                 return Container();
                //               }
                //             }),
                //       ),
                //     ],
                //   ),
                // );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
