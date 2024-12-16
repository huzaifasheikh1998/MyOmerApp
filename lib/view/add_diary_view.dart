import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mvvm/main.dart';
import 'package:mvvm/res/color.dart';
import 'package:mvvm/res/components/text.dart';
import 'package:mvvm/res/images.dart';
import 'package:mvvm/res/size.dart';
import 'package:mvvm/utils/utils.dart';
import 'package:mvvm/view_model/journal_view_model.dart';
import 'package:provider/provider.dart';

class AddDiaryView extends StatefulWidget {
  DateTime dateTime;
  AddDiaryView({super.key, required this.dateTime});

  @override
  State<AddDiaryView> createState() => _AddDiaryViewState();
}

class _AddDiaryViewState extends State<AddDiaryView> {
  late TextEditingController diaryController;
  JournalViewModel journalViewModel = JournalViewModel();
  @override
  void initState() {
    journalViewModel.initializeNotification();
    diaryController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    diaryController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Sized sized = Sized(context);
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                // width: sized.width(0.95),
                margin: EdgeInsets.symmetric(horizontal: sized.width(0.023)),
                padding: EdgeInsets.symmetric(
                    vertical: sized.height(0.03),
                    horizontal: sized.height(0.03)),
                // decoration: BoxDecoration(
                //     color: AppColors.white,
                //     borderRadius: BorderRadius.circular(30)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(
                            Icons.arrow_back_ios_new,
                            color: AppColors.secondaryColor,
                            size: sized.height(0.037),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: sized.height(0.02),
                    ),
                    Content(
                      data: "Add Diary",
                      size: sized.height(0.03),
                      weight: FontWeight.bold,
                      color: AppColors.secondaryColor,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            // Content(
                            //   data: "Make Decision",
                            //   size: sized.height(0.02),
                            //   weight: FontWeight.bold,
                            //   color: AppColors.secondaryColor,
                            // ),
                            // SizedBox(
                            //   height: sized.height(.013),
                            // ),
                            Content(
                              data: Utils.dateFormat(widget.dateTime),
                              size: sized.height(0.024),
                              weight: FontWeight.bold,
                              color: AppColors.primaryColor,
                              alignment: TextAlign.start,
                            ),
                            SizedBox(
                              height: sized.height(.013),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Consumer<JournalViewModel>(
                                builder: (context, value, child) {
                              return Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      value
                                          .setNotification(!value.notification);
                                    },
                                    child: Container(
                                        height: sized.height(0.052),
                                        margin: EdgeInsets.only(right: 5),
                                        padding: EdgeInsets.all(6),
                                        decoration: BoxDecoration(
                                          color: value.notification
                                              ? AppColors.secondaryColor
                                              : AppColors.white,
                                          shape: BoxShape.circle,
                                        ),
                                        child: Image.asset(Images.noti,
                                            height: sized.height(0.04),
                                            color: value.notification
                                                ? AppColors.white
                                                : AppColors.secondaryColor)),
                                  ),
                                  GestureDetector(
                                    onTap: value.loading
                                        ? null
                                        : () {
                                            if (diaryController
                                                .text.isEmpty) {
                                              Utils.snackBar(
                                                  "Write Diary", context);
                                            } else {
                                              String date = Utils.dateFormat2(
                                                      widget.dateTime)
                                                  .toString();
                                              final noti = value.notification
                                                  ? "1"
                                                  : "0";
                                              final content = diaryController
                                                  .text
                                                  .toString();
                                              var body = {
                                                "user_id": loginId,
                                                "comment": content,
                                                "date": date,
                                                "day": "1",
                                                "is_notify": noti
                                              };
                                              print(body);
                                              value.setDiary(body,
                                                  diaryController, context);
                                            }
                                            // Navigator.pop(context);
                                          },
                                    child: Container(
                                      height: sized.height(0.052),
                                      padding: EdgeInsets.all(3),
                                      decoration: BoxDecoration(
                                        color: value.loading
                                            ? AppColors.white
                                            : AppColors.orange,
                                        shape: BoxShape.circle,
                                      ),
                                      child: Icon(
                                        Icons.add,
                                        size: sized.height(0.04),
                                        color: value.loading
                                            ? AppColors.secondaryColor
                                            : AppColors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            }),
                            SizedBox(
                              height: sized.height(.013),
                            )
                          ],
                        ),
                      ],
                    ),
                    Container(
                      height: sized.height(0.25),
                      child: TextField(
                        style: TextStyle(color: AppColors.primaryColor),
                        controller: diaryController,
                        keyboardType: TextInputType.multiline,
                        maxLines: 20,
                        //  minLines: 4,
                        // expands: true,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Color.fromARGB(255, 250, 249, 249),
                          //  fillColor: Theme.of(context).scaffoldBackgroundColor,
                          hintText: 'Write',
                          counterText: "",
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: sized.height(0.023)),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(
                                color: AppColors.transparent, width: 2.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: const BorderSide(
                                color: AppColors.transparent, width: 2),
                          ),
                          // errorStyle: InputDecoration.collapsed(hintText: hintText)
                        ),
                      ),
                    ),

                    // Align(
                    //   alignment: Alignment.centerRight,
                    //   child: Container(
                    //      margin: EdgeInsets.only(top: sized.height(0.01)),
                    //       padding: EdgeInsets.all(sized.height(0.015)),
                    //       decoration: BoxDecoration(
                    //             color: AppColors.secondaryColor,
                    //             borderRadius: BorderRadius.circular(20),
                    //       ),
                    //       child: Content(
                    //             data: "Add",
                    //             size: sized.height(0.02),
                    //             color: AppColors.whiteColor,
                    //       ),
                    //       ),
                    // )
                    // Content(
                    //     data:
                    //         "Different devices can have a wide range of screen heights, and assuming a fixed layout height may not work well for all of them. Additionally, other factors such as font sizes, margins, and padding may also need to be adjusted for responsive design.",
                    //     size: 15,

                    //     color: AppColors.primaryColor,
                    //   ),
                  ],
                ),
              ),
              SizedBox(
                height: sized.height(0.03),
              )
            ],
          ),
        ),
      ),
    );
  }
}
