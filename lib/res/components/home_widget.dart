import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mvvm/res/color.dart';
import 'package:mvvm/res/components/text.dart';
import 'package:mvvm/res/images.dart';
import 'package:mvvm/res/size.dart';
import 'package:mvvm/utils/utils.dart';
import 'package:mvvm/view_model/home_view_model.dart';
import 'package:mvvm/view_model/navbar_view_model.dart';
import 'package:provider/provider.dart';

// class HomeWidget extends StatelessWidget {
//   final String day;
//   final String title;
//   final String subTitle;
//   final String heading;
//   final String content;
//   const HomeWidget(
//       {super.key,
//       required this.day,
//       required this.title,
//       required this.subTitle,
//       required this.heading,
//       required this.content});

//   @override
//   Widget build(BuildContext context) {
//     Sized sized = Sized(context);
//     NavbarViewModel navbarViewModel =
//         Provider.of<NavbarViewModel>(context, listen: false);
//     HomeViewModel homeViewModel =
//         Provider.of<HomeViewModel>(context, listen: true);
//     return Column(
//       // mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         SizedBox(
//           height: sized.height(.01),
//         ),
//         Container(
//           margin: EdgeInsets.all(sized.primaryMargin),
//           child: Card(
//             shape:
//                 RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
//             child: Container(
//               decoration: BoxDecoration(
//                   color: AppColors.primaryColor,
//                   borderRadius: BorderRadius.circular(30)),
//               child: Column(
//                 children: [
//                   SizedBox(
//                     height: sized.height(0.02),
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       homeViewModel.index == 2
//                           ? Row(
//                               children: [
//                                 Image.asset(
//                                   Images.exercise,
//                                   color: AppColors.transparent,
//                                   height: 30,
//                                 ),
//                                 SizedBox(
//                                   width: sized.height(0.034),
//                                 )
//                               ],
//                             )
//                           : Container(),
//                       Content(
//                         data: "Date " +
//                             Utils.dateFormat(
//                                 DateTime.parse("2023-06-08 01:21:06")),
//                         size: sized.height(0.024),
//                         weight: FontWeight.bold,
//                         color: AppColors.thirdColor,
//                       ),
//                       homeViewModel.index == 2
//                           ? Row(
//                               children: [
//                                 GestureDetector(
//                                     onTap: () {
//                                       navbarViewModel.changeView(2);
//                                     },
//                                     child: Image.asset(
//                                       Images.exercise,
//                                       color: AppColors.orange,
//                                       height: 30,
//                                     )),
//                                 SizedBox(
//                                   width: sized.height(0.034),
//                                 )
//                               ],
//                             )
//                           : Container()
//                     ],
//                   ),
//                   SizedBox(
//                     height: sized.height(.013),
//                   ),
//                   Content(
//                     data: title,
//                     size: 15,
//                     weight: FontWeight.bold,
//                     color: AppColors.thirdColor,
//                     alignment: TextAlign.center,
//                   ),
//                   // Content(
//                   //   data: subTitle,
//                   //   size: 15,
//                   //   weight: FontWeight.bold,
//                   //   color: AppColors.thirdColor,
//                   //   alignment: TextAlign.center,
//                   // ),
//                   SizedBox(
//                     height: sized.height(0.02),
//                   ),
//                   Container(
//                     height: sized.height(0.5),
//                     width: 200,
//                     padding: EdgeInsets.all(sized.height(0.034)),
//                     decoration: BoxDecoration(
//                         color: AppColors.thirdColor,
//                         borderRadius: BorderRadius.circular(30)),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: [
//                         Column(
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           mainAxisSize: MainAxisSize.max,
//                           children: [
//                             //  Content(data: "Day 23", size: 18,weight: FontWeight.bold,color: AppColors.primaryColor,),
//                             //  SizedBox(height: sized.height(.013),),
//                             //  Content(data: "Netzach of Netzach\nEndurance in Endurance", size: 15,weight: FontWeight.bold,color: AppColors.primaryColor,),
//                             //  SizedBox(height: sized.height(.013),),
//                             Content(
//                               data: heading,
//                               size: sized.height(0.024),
//                               weight: FontWeight.bold,
//                               color: AppColors.primaryColor,
//                             ),
//                             SizedBox(
//                               height: sized.height(0.02),
//                             ),
//                             Content(
//                               data:
//                                   "sdfkjasdkfjasdkfalkfjkdfa fcasijfadfa dksjfasdf fajfaf43md acdmsa famdfasf",
//                               size: sized.height(0.024),
//                               weight: FontWeight.bold,
//                               color: AppColors.primaryColor,
//                             ),
//                             //  SizedBox(height: sized.height(0.02),),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }

class HomeWidget extends StatelessWidget {
  final String day;
  final String title;
  final String subTitle;
  final String heading;
  final String content;
  const HomeWidget(
      {super.key,
      required this.day,
      required this.title,
      required this.subTitle,
      required this.heading,
      required this.content});

  @override
  Widget build(BuildContext context) {
    Sized sized = Sized(context);
    return Column(
      children: [
        Container(
          // height: ,
          margin: EdgeInsets.all(sized.primaryMargin),
          child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            child: Container(
              //  height: 100,

              // padding: EdgeInsets.all(sized.height(0.034)),

              // padding: EdgeInsets.only(
              //     top: sized.height(0.034), left: sized.height(0.034)),
              decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(30)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.all(sized.height(0.034)),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Content(
                              data: "Date " +
                                  Utils.dateFormat(DateTime.parse(day)),
                              size: sized.height(0.024),
                              weight: FontWeight.bold,
                              color: AppColors.thirdColor,
                            ),
                            GestureDetector(
                              onTap: () {
                                Utils().shareText(
                                    "Date $day\n$title\n$heading\n$content");
                              },
                              child: Image.asset(
                                Images.share,
                                height: sized.height(0.04),
                                color: AppColors.secondaryColor,
                              ),
                            )
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
                          alignment: TextAlign.start,
                        ),
                      ],
                    ),
                  ),
                  // SizedBox(
                  //   height: sized.height(0.02),
                  // ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: sized.height(0.35),
                          padding: EdgeInsets.all(sized.height(0.034)),
                          decoration: BoxDecoration(
                              color: AppColors.thirdColor,
                              borderRadius: BorderRadius.circular(30)),
                          child: Scrollbar(
                            thumbVisibility: true,
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Content(
                                    data: heading,
                                    size: sized.height(0.024),
                                    weight: FontWeight.bold,
                                    color: AppColors.primaryColor,
                                  ),
                                  SizedBox(
                                    height: sized.height(0.02),
                                  ),
                                  Content(
                                    data: content +
                                        content +
                                        content +
                                        content +
                                        content +
                                        content,
                                    size: 15,
                                    // weight: FontWeight.bold,
                                    color: AppColors.primaryColor,
                                  ),
                                  // Row(
                                  //   crossAxisAlignment: CrossAxisAlignment.end,
                                  //   children: [
                                  //     SizedBox(
                                  //       height: 30,
                                  //     ),
                                  //     Icon(
                                  //       Icons.copyright_sharp,
                                  //       size: 15,
                                  //       color: AppColors.primaryColor,
                                  //     ),
                                  //     // Content(
                                  //     //   data:
                                  //     //       " Copyright Kehot Publication Society, Brooklyn NYC",
                                  //     //   size: 11,
                                  //     //   weight: FontWeight.bold,
                                  //     //   color: AppColors.primaryColor,
                                  //     // ),
                                  //   ],
                                  // ),
                                  //  SizedBox(height: sized.height(0.02),),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
