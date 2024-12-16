// import 'package:flutter/material.dart';
// import 'package:mvvm/res/color.dart';
// import 'package:mvvm/res/components/text.dart';
// import 'package:mvvm/res/images.dart';
// import 'package:mvvm/res/size.dart';
// import 'package:mvvm/utils/utils.dart';
// import 'package:mvvm/view_model/journal_view_model.dart';
// import 'package:provider/provider.dart';

// void addVoice(BuildContext context, String Title, String day) {
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
//                   mainAxisSize: MainAxisSize.min,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Content(
//                       data: Title,
//                       size: sized.height(0.03),
//                       weight: FontWeight.bold,
//                       color: AppColors.secondaryColor,
//                     ),
//                     SizedBox(
//                       height: sized.height(.013),
//                     ),
//                     Content(
//                       data: day,
//                       size: sized.height(0.022),
//                       weight: FontWeight.bold,
//                       color: AppColors.primaryColor,
//                       alignment: TextAlign.start,
//                     ),
//                     SizedBox(
//                       height: sized.height(.013),
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.end,
//                       children: [
//                         Consumer<JournalViewModel>(
//                             builder: (context, value, child) {
//                           return GestureDetector(
//                             onTap: () {
//                               value.setNotification(!value.notification);
//                             },
//                             child: Container(
//                                 height: sized.height(0.052),
//                                 margin: EdgeInsets.only(right: 5),
//                                 padding: EdgeInsets.all(6),
//                                 decoration: BoxDecoration(
//                                   color: value.notification
//                                       ? AppColors.secondaryColor
//                                       : AppColors.white,
//                                   shape: BoxShape.circle,
//                                 ),
//                                 child: Image.asset(Images.mic,
//                                     height: sized.height(0.04),
//                                     color: value.notification
//                                         ? AppColors.white
//                                         : AppColors.secondaryColor)),
//                           );
//                         }),
//                         GestureDetector(
//                           onTap: () {
//                             Navigator.pop(context);
//                           },
//                           child: Container(
//                             height: sized.height(0.052),
//                             padding: EdgeInsets.all(3),
//                             decoration: BoxDecoration(
//                               color: AppColors.white,
//                               shape: BoxShape.circle,
//                             ),
//                             child: Image.asset(
//                               Images.video3,
//                               width: sized.height(0.04),
//                               color: AppColors.secondaryColor,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
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
