import 'package:flutter/material.dart';
import 'package:mvvm/res/color.dart';
import 'package:mvvm/res/images.dart';
import 'package:mvvm/view_model/navbar_view_model.dart';
import 'package:provider/provider.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          height: 70,
          padding: EdgeInsets.zero,
          decoration: const BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: Colors.grey,
                    blurRadius: 15.0,
                    spreadRadius: 1.0,
                    offset: Offset(-1.0, -1.0)),
              ],
              color: AppColors.greyColor,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20))),
          child: Consumer<NavbarViewModel>(builder: (context, value, child) {
            return Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // const Expanded(
                  //     flex: 1,
                  //     child: SizedBox(
                  //       width: 2,
                  //     )),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AnimatedContainer(
                        height: 5,
                        width: 37,
                        duration: Duration(milliseconds: 200),
                        curve: Curves.easeInToLinear,
                        // margin: EdgeInsets.only(right: 10),
                        padding: EdgeInsets.zero,
                        margin: EdgeInsets.zero,
                        decoration: BoxDecoration(
                            color: value.view.toString() == "HomeView"
                                ? AppColors.secondaryColor
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(20)),
                        // child: Image.asset(
                        //   card,
                        //   height: 29,
                        // ),
                      ),
                      GestureDetector(
                        onTap: () {
                          value.changeView(0);
                        },
                        child: AnimatedContainer(
                          margin: EdgeInsets.only(top: 6, bottom: 4),
                          duration: Duration(seconds: 2),
                          child: Image.asset(
                            Images.home,
                            // value.view == HomeView() ? home : home2,
                            height: 29,
                            color: value.view.toString() == "HomeView"
                                ? AppColors.primaryColor
                                : AppColors.secondaryColor,
                          ),
                        ),
                      ),
                      AnimatedOpacity(
                          opacity: value.view.toString() == "HomeView" ? 1 : 0,
                          duration: Duration(milliseconds: 500),
                          child: Text(
                            "Home",
                            style: TextStyle(
                                fontSize: 14,
                                color: value.view.toString() == "HomeView"
                                    ? AppColors.primaryColor
                                    : AppColors.secondaryColor,
                                fontWeight: FontWeight.w600),
                          )),
                      SizedBox(
                        height: 5,
                      )
                    ],
                  ),
                  // Expanded(
                  //     flex: 1,
                  //     child: SizedBox(
                  //       width: 2,
                  //     )),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AnimatedContainer(
                        height: 5,
                        width: 37,
                        duration: Duration(milliseconds: 200),
                        curve: Curves.fastLinearToSlowEaseIn,
                        // margin: EdgeInsets.only(right: 10),
                        padding: EdgeInsets.zero,
                        margin: EdgeInsets.zero,
                        decoration: BoxDecoration(
                            color: value.view.toString() == "JournalView"
                                ? AppColors.secondaryColor
                                : Colors.transparent),
                        // child: Image.asset(
                        //   card,
                        //   height: 29,
                        // ),
                      ),
                      GestureDetector(
                        onTap: () {
                          value.changeView(1);
                        },
                        child: AnimatedContainer(
                          margin: EdgeInsets.only(top: 6, bottom: 4),
                          duration: Duration(seconds: 2),
                          child: Image.asset(
                            Images.journal,
                            // value.view == HomeView() ? tankerAppColors. : tankerGrey,
                            height: 29,
                            color: value.view.toString() == "JournalView"
                                ? AppColors.primaryColor
                                : AppColors.secondaryColor,
                          ),
                        ),
                      ),
                      AnimatedOpacity(
                          opacity:
                              value.view.toString() == "JournalView" ? 1 : 0,
                          duration: Duration(milliseconds: 500),
                          child: Text(
                            "Journal",
                            style: TextStyle(
                                fontSize: 14,
                                color: value.view.toString() == "JournalView"
                                    ? AppColors.primaryColor
                                    : Colors.transparent,
                                fontWeight: FontWeight.w600),
                          )),
                      SizedBox(
                        height: 5,
                      )
                    ],
                  ),
                  // Expanded(
                  //     flex: 5,
                  //     child: SizedBox(
                  //       width: 1,
                  //     )),
                  //  GestureDetector(
                  //   onTap: () {
                  //     value.changeView(2);
                  //     // print("<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<$auctionHugagId>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
                  //   },
                  //   child: AnimatedContainer(
                  //     margin: EdgeInsets.only(bottom: 40),
                  //     duration: Duration(seconds: 1),
                  //     curve: Curves.fastLinearToSlowEaseIn,
                  //     // margin: EdgeInsets.only(right: 10),
                  //     padding: EdgeInsets.symmetric(vertical: 14, horizontal: 15),
                  //     decoration: BoxDecoration(
                  //       shape: BoxShape.circle,
                  //       color:AppColors.secondaryColor ,
                  //     ),
                  //     child: Image.asset(
                  //       add,
                  //       color:Colors.white,
                  //       height: 22,
                  //     ),
                  //   ),
                  // ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      AnimatedContainer(
                        height: 5,
                        width: 37,
                        duration: Duration(milliseconds: 200),
                        curve: Curves.easeInToLinear,
                        // margin: EdgeInsets.only(right: 10),
                        padding: EdgeInsets.zero,
                        margin: EdgeInsets.zero,
                        decoration: BoxDecoration(
                            color: value.view.toString() == "ExerciseView"
                                ? AppColors.secondaryColor
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(20)),
                        // child: Image.asset(
                        //   card,
                        //   height: 29,
                        // ),
                      ),
                      GestureDetector(
                        onTap: () {
                          value.changeView(2);
                        },
                        child: AnimatedContainer(
                          margin: EdgeInsets.only(top: 6, bottom: 4),
                          duration: Duration(seconds: 2),
                          child: Image.asset(
                            Images.exercise,
                            // value.view == ExerciseView() ? home : home2,
                            height: 29,
                            color: value.view.toString() == "ExerciseView"
                                ? AppColors.primaryColor
                                : AppColors.secondaryColor,
                          ),
                        ),
                      ),
                      AnimatedOpacity(
                          opacity:
                              value.view.toString() == "ExerciseView" ? 1 : 0,
                          duration: Duration(milliseconds: 500),
                          child: Text(
                            "Exercise",
                            style: TextStyle(
                                fontSize: 14,
                                color: value.view.toString() == "ExerciseView"
                                    ? AppColors.primaryColor
                                    : Colors.transparent,
                                fontWeight: FontWeight.w600),
                          )),
                      SizedBox(
                        height: 5,
                      )
                    ],
                  ),
                  // Expanded(
                  //     flex: 1,
                  //     child: SizedBox(
                  //       width: 2,
                  //     )),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      AnimatedContainer(
                        height: 5,
                        width: 37,
                        duration: Duration(milliseconds: 200),
                        curve: Curves.easeInToLinear,
                        // margin: EdgeInsets.only(right: 10),
                        padding: EdgeInsets.zero,
                        margin: EdgeInsets.zero,
                        decoration: BoxDecoration(
                            color: value.view.toString() == "VideoView"
                                ? AppColors.secondaryColor
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(20)),
                        // child: Image.asset(
                        //   card,
                        //   height: 29,
                        // ),
                      ),
                      GestureDetector(
                        onTap: () {
                          value.changeView(3);
                        },
                        child: AnimatedContainer(
                          margin: EdgeInsets.only(top: 6, bottom: 4),
                          duration: Duration(seconds: 2),
                          // duration: Duration(seconds: 1),
                          // curve: Curves.fastLinearToSlowEaseIn,
                          // padding: EdgeInsets.symmetric(vertical: 14, horizontal: 15),
                          // decoration: BoxDecoration(
                          //   shape: BoxShape.circle,
                          // ),
                          child: Image.asset(
                            Images.video,
                            // value.view == HomeView() ? cardAppColors.secondaryColor : card,
                            height: 29,
                            color: value.view.toString() == "VideoView"
                                ? AppColors.primaryColor
                                : AppColors.secondaryColor,
                          ),
                        ),
                      ),
                      AnimatedOpacity(
                          opacity: value.view.toString() == "VideoView" ? 1 : 0,
                          duration: Duration(milliseconds: 500),
                          child: Text(
                            "Video",
                            style: TextStyle(
                                fontSize: 14,
                                color: value.view.toString() == "VideoView"
                                    ? AppColors.primaryColor
                                    : Colors.transparent,
                                fontWeight: FontWeight.w600),
                          )),
                      SizedBox(
                        height: 5,
                      )
                    ],
                  ),
                  // Expanded(
                  //     flex: 1,
                  //     child: SizedBox(
                  //       width: 1,
                  //     ))
                ],
              ),
            );
          }),
        ),
      ],
    );
  }
}
