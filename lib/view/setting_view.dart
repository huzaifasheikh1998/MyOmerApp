import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvvm/res/color.dart';
import 'package:mvvm/res/components/appbar2.dart';
import 'package:mvvm/res/components/text.dart';
import 'package:mvvm/res/images.dart';
import 'package:mvvm/res/size.dart';
import 'package:time_picker_spinner_pop_up/time_picker_spinner_pop_up.dart';

class SettingView extends StatelessWidget {
  const SettingView({super.key});

  @override
  Widget build(BuildContext context) {
    Sized sized = Sized(context);
    bool _isSwitch = false;
    return Scaffold(
      appBar: MyAppBar2(title: "ME365"),
      body: Column(children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          padding: EdgeInsetsDirectional.symmetric(
              vertical: sized.height(0.03), horizontal: sized.width(0.02)),
          decoration: BoxDecoration(
              color: AppColors.lightGrey,
              borderRadius: BorderRadius.circular(20)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    Images.setting,
                    height: 27,
                    color: AppColors.primaryColor,
                  ),
                  Content(
                    data: " Setting",
                    size: 20,
                    weight: FontWeight.w600,
                    color: AppColors.primaryColor,
                  ),
                ],
              ),
              SizedBox(
                height: sized.height(0.02),
              ),
              Content(
                data: "Notification Settings:",
                size: sized.height(0.02),
                color: AppColors.primaryColor,
              ),
              SizedBox(
                height: sized.height(0.02),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Content(
                      data: "Daily Notification", size: sized.height(0.018)),
                  Switch(
                      activeColor: AppColors.primaryColor,
                      inactiveThumbColor: AppColors.dayWeekColorList[4],
                      inactiveTrackColor: AppColors.thirdColor,
                      // activeTrackColor: AppColors.secondaryColor,
                      value: true,
                      onChanged: (value) {
                        _isSwitch = value;
                      })
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        print("object");
                        // po();
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Content(
                              data: "Schedule Notification",
                              size: sized.height(0.018)),
                          SizedBox(
                            height: sized.height(0.01),
                          ),
                          Content(
                              data:
                                  "Get all your Notifications at schedule time 8:00 PM.\nTap to customize delivery time.",
                              size: sized.height(0.013))
                        ],
                      ),
                    ),
                  ),
                  Switch(
                      activeColor: AppColors.primaryColor,
                      inactiveThumbColor: AppColors.dayWeekColorList[4],
                      inactiveTrackColor: AppColors.thirdColor,
                      // activeTrackColor: AppColors.secondaryColor,
                      value: false,
                      onChanged: (value) {
                        _isSwitch = value;
                      })
                ],
              )
            ],
          ),
        )
      ]),
    );
  }
}

class po extends StatelessWidget {
  const po({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          left: 30,
          top: 60,
          child: TimePickerSpinnerPopUp(
            mode: CupertinoDatePickerMode.date,
            initTime: DateTime.now(),
            minTime: DateTime.now().subtract(const Duration(days: 10)),
            maxTime: DateTime.now().add(const Duration(days: 10)),
            barrierColor: Colors.black12, //Barrier Color when pop up show
            // minuteInterval: 1,
            // padding: const EdgeInsets.fromLTRB(12, 10, 12, 10),
            // cancelText: 'Cancel',
            // confirmText: 'OK',
            pressType: PressType.singlePress,
            timeFormat: 'dd/MM/yyyy',
            // Customize your time widget
            // timeWidgetBuilder: (dateTime) {},
            onChange: (dateTime) {
              // Implement your logic with select dateTime
            },
          ),
        ),
      ],
    );
  }
}
