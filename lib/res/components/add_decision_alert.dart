// import 'package:flutter/material.dart';
// import 'package:mvvm/res/color.dart';
// import 'package:mvvm/res/components/text.dart';
// import 'package:mvvm/res/images.dart';
// import 'package:mvvm/res/size.dart';
// import 'package:mvvm/utils/utils.dart';
// import 'package:mvvm/view_model/journal_view_model.dart';
// import 'package:provider/provider.dart';

// void addDecisionAlert(BuildContext context, dateTime, controller) {
//   Sized sized = Sized(context);
//   showGeneralDialog(
//     context: context,
//     barrierLabel: "Barrier",
//     barrierDismissible: true,
//     barrierColor: Colors.black.withOpacity(0.5),
//     transitionDuration: Duration(milliseconds: 450),
//     transitionBuilder: (_, anim, __, child) {
//       final tween = Tween(begin: Offset(0, 1), end: Offset.zero)
//           .chain(CurveTween(curve: Curves.easeInQuad));
//       // Tween<Offset> tween;
//       // if (anim.status == AnimationStatus.reverse) {
//       //   tween = Tween(begin: Offset(0, 1), end: Offset.zero);
//       // } else {
//       //   tween = Tween(begin: Offset(0, 1), end: Offset.zero);
//       // }

//       return SlideTransition(
//         position: tween.animate(anim),
//         child:
//             //  SliverFadeTransition(
//             //   opacity: anim,
//             //   sliver: child,
//             // )
//             FadeTransition(
//           opacity: anim,
//           child: child,
//         ),
//       );
//     },
//     pageBuilder: (_, __, ___) {
//       return Center(
//         child: Material(
//           color: AppColors.transparent,
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Container(
//                 // width: sized.width(0.95),
//                 margin: EdgeInsets.symmetric(horizontal: sized.width(0.023)),
//                 padding: EdgeInsets.symmetric(
//                     vertical: sized.height(0.03),
//                     horizontal: sized.height(0.03)),
//                 decoration: BoxDecoration(
//                     color: AppColors.white,
//                     borderRadius: BorderRadius.circular(30)),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Column(
//                           children: [
//                             Content(
//                               data: "Make Decision",
//                               size: sized.height(0.02),
//                               weight: FontWeight.bold,
//                               color: AppColors.secondaryColor,
//                             ),
//                             SizedBox(
//                               height: sized.height(.013),
//                             ),
//                             Content(
//                               data: Utils.dateFormat(dateTime),
//                               size: sized.height(0.024),
//                               weight: FontWeight.bold,
//                               color: AppColors.primaryColor,
//                               alignment: TextAlign.start,
//                             ),
//                             SizedBox(
//                               height: sized.height(.013),
//                             ),
//                           ],
//                         ),
//                         Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Row(
//                               children: [
//                                 Consumer<JournalViewModel>(
//                                     builder: (context, value, child) {
//                                   return GestureDetector(
//                                     onTap: value
//                                         .setNotification(!value.notification),
//                                     child: Container(
//                                         height: sized.height(0.052),
//                                         margin: EdgeInsets.only(right: 5),
//                                         padding: EdgeInsets.all(6),
//                                         decoration: BoxDecoration(
//                                           color: value.notification
//                                               ? AppColors.secondaryColor
//                                               : AppColors.white,
//                                           shape: BoxShape.circle,
//                                         ),
//                                         child: Image.asset(Images.noti,
//                                             height: sized.height(0.04),
//                                             color: value.notification
//                                                 ? AppColors.white
//                                                 : AppColors.secondaryColor)),
//                                   );
//                                 }),
//                                 GestureDetector(
//                                   onTap: () {
//                                     Navigator.pop(context);
//                                   },
//                                   child: Container(
//                                     height: sized.height(0.052),
//                                     padding: EdgeInsets.all(3),
//                                     decoration: BoxDecoration(
//                                       color: AppColors.secondaryColor,
//                                       shape: BoxShape.circle,
//                                     ),
//                                     child: Icon(
//                                       Icons.add,
//                                       size: sized.height(0.04),
//                                       color: Colors.white,
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             SizedBox(
//                               height: sized.height(.013),
//                             )
//                           ],
//                         ),
//                       ],
//                     ),
//                     Container(
//                       height: sized.height(0.25),
//                       child: TextField(
//                         style: TextStyle(color: AppColors.primaryColor),
//                         controller: controller,
//                         keyboardType: TextInputType.multiline,
//                         maxLines: 20,
//                         //  minLines: 4,
//                         // expands: true,
//                         decoration: InputDecoration(
//                           filled: true,
//                           fillColor: Color.fromARGB(255, 250, 249, 249),
//                           //  fillColor: Theme.of(context).scaffoldBackgroundColor,
//                           hintText: 'Write',
//                           counterText: "",
//                           contentPadding: EdgeInsets.symmetric(
//                               horizontal: 20, vertical: sized.height(0.023)),
//                           focusedBorder: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(30),
//                             borderSide: BorderSide(
//                                 color: AppColors.transparent, width: 2.0),
//                           ),
//                           enabledBorder: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(30),
//                             borderSide: const BorderSide(
//                                 color: AppColors.transparent, width: 2),
//                           ),
//                           // errorStyle: InputDecoration.collapsed(hintText: hintText)
//                         ),
//                       ),
//                     ),

//                     // Align(
//                     //   alignment: Alignment.centerRight,
//                     //   child: Container(
//                     //      margin: EdgeInsets.only(top: sized.height(0.01)),
//                     //       padding: EdgeInsets.all(sized.height(0.015)),
//                     //       decoration: BoxDecoration(
//                     //             color: AppColors.secondaryColor,
//                     //             borderRadius: BorderRadius.circular(20),
//                     //       ),
//                     //       child: Content(
//                     //             data: "Add",
//                     //             size: sized.height(0.02),
//                     //             color: AppColors.whiteColor,
//                     //       ),
//                     //       ),
//                     // )
//                     // Content(
//                     //     data:
//                     //         "Different devices can have a wide range of screen heights, and assuming a fixed layout height may not work well for all of them. Additionally, other factors such as font sizes, margins, and padding may also need to be adjusted for responsive design.",
//                     //     size: 15,

//                     //     color: AppColors.primaryColor,
//                     //   ),
//                   ],
//                 ),
//               ),
//               SizedBox(
//                 height: sized.height(0.03),
//               )
//             ],
//           ),
//         ),
//       );
//     },
//   );
// }
