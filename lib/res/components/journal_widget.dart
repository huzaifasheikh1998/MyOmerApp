// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:mvvm/main.dart';
// import 'package:mvvm/res/color.dart';
// import 'package:mvvm/res/components/text.dart';
// import 'package:mvvm/res/size.dart';
// import 'package:mvvm/utils/utils.dart';
// import 'package:mvvm/view_model/journal_view_model.dart';
// import 'package:provider/provider.dart';

// class JournalWidget extends StatelessWidget {
//   final String day;
//   final String heading;
//   final TextEditingController dairyController;
//   JournalWidget(
//       {super.key,
//       required this.day,
//       required this.heading,
//       required this.dairyController});
//   //  TextEditingController journalController = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     Sized sized = Sized(context);
//     return Column(
//       children: [
//         Card(
//           shape:
//               RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
//           child: Container(
//             //  height: sized.height(0.4),
//             // padding: EdgeInsets.all(sized.height(0.034)),
//             decoration: BoxDecoration(
//                 color: AppColors.secondaryColor,
//                 borderRadius: BorderRadius.circular(30)),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Container(
//                   padding: EdgeInsets.only(
//                       top: sized.height(0.034),
//                       left: sized.height(0.034),
//                       right: sized.height(0.034)),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Content(
//                             data: "Day $day",
//                             size: sized.height(0.03),
//                             weight: FontWeight.bold,
//                             color: AppColors.lightGrey,
//                           ),
//                           Consumer<JournalViewModel>(
//                               builder: (context, value, child) {
//                             return GestureDetector(
//                               onTap: value.loading
//                                   ? null
//                                   : () {
//                                       if (dairyController.text.isEmpty) {
//                                         Utils.snackBar(
//                                             "Enter Content", context);
//                                       } else {
//                                         value.setDairy({
//                                           "user_id": loginId,
//                                           "comment":
//                                               dairyController.text.toString(),
//                                           "date":
//                                               Utils.dateFormat2(DateTime.now())
//                                                   .toString(),
//                                           "day": day,
//                                           "is_notify": "1"
//                                         }, dairyController);
//                                       }
//                                     },
//                               child: Container(
//                                 padding: EdgeInsets.all(3),
//                                 decoration: BoxDecoration(
//                                   color: value.loading
//                                       ? AppColors.transparent
//                                       : AppColors.white,
//                                   shape: BoxShape.circle,
//                                 ),
//                                 child: Icon(
//                                   Icons.add,
//                                   size: sized.height(0.04),
//                                   color: value.loading
//                                       ? AppColors.white
//                                       : AppColors.secondaryColor,
//                                 ),
//                               ),
//                             );
//                           })
//                         ],
//                       ),
//                       SizedBox(
//                         height: sized.height(.013),
//                       ),
//                       // Content(
//                       //   data: "Netzach of Netzach\nEndurance in Endurance",
//                       //   size: 15,
//                       //   weight: FontWeight.bold,
//                       //   color: AppColors.lightGrey,
//                       //   alignment: TextAlign.start,
//                       // ),
//                       Content(
//                         data: heading,
//                         size: 15,
//                         weight: FontWeight.bold,
//                         color: AppColors.lightGrey,
//                         alignment: TextAlign.start,
//                       ),
//                     ],
//                   ),
//                 ),
//                 SizedBox(
//                   height: sized.height(0.02),
//                 ),
//                 Container(
//                     decoration: BoxDecoration(
//                       // color: AppColors.greyColor,
//                       // border: Border.all(color: AppColors.greyColor),
//                       borderRadius: BorderRadius.circular(20),
//                     ),
//                     child: TextField(
//                       style: TextStyle(color: AppColors.primaryColor),
//                       controller: dairyController,
//                       keyboardType: TextInputType.multiline,
//                       maxLines: 12,
//                       decoration: InputDecoration(
//                         filled: true,
//                         fillColor: AppColors.lightGrey,
//                         //  fillColor: Theme.of(context).scaffoldBackgroundColor,
//                         hintText: 'Type',
//                         counterText: "",
//                         contentPadding: EdgeInsets.symmetric(
//                             horizontal: 20, vertical: sized.height(0.023)),
//                         focusedBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(30),
//                           borderSide: BorderSide(
//                               color: AppColors.transparent, width: 2.0),
//                         ),
//                         enabledBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(30),
//                           borderSide: const BorderSide(
//                               color: AppColors.transparent, width: 2),
//                         ),
//                         // errorStyle: InputDecoration.collapsed(hintText: hintText)
//                       ),
//                     ))
//               ],
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
