import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mvvm/main.dart';
import 'package:mvvm/res/color.dart';
import 'package:mvvm/res/components/tab_tile.dart';
import 'package:mvvm/res/images.dart';
import 'package:mvvm/utils/routes/routes_name.dart';
import 'package:mvvm/view_model/tab_view_model.dart';

import '../res/components/appbar2.dart';

class TabView extends StatelessWidget {
  const TabView({super.key});

  @override
  Widget build(BuildContext context) {
    final tabViewModel = TabViewModel();
    return Scaffold(
      appBar: MyAppBar2(title: "ME365"),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 18, horizontal: 15),
            padding: EdgeInsets.all(7),
            decoration: BoxDecoration(
                color: AppColors.lightGrey,
                borderRadius: BorderRadius.circular(20)),
            child: Column(
              children: [
                GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, RoutesName.chart);
                    },
                    child: tabTile(Images.chart, "ME365 Chart")),
                // tabTile(Images.book, "Get Book"),
                // tabTile(Images.donate, "Donate"),
                GestureDetector(
                    onTap: () {
                      tabViewModel.fetchJournal({"user_id": loginId});
                    },
                    child: tabTile(Images.journal, "Export Journal")),
                tabTile(Images.share, "Share"),
                GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, RoutesName.setting);
                    },
                    child: tabTile(Images.setting, "Setting")),
                tabTile(Images.about, "What is ME365"),
                // ListTile(
                //   leading: Image.asset(Images.video2,color: AppColors.primaryColor,height: 19,),
                //   title: Content(data: "Omer Chart", size: 16,color: AppColors.primaryColor,weight: FontWeight.w600,),
                //   trailing: Icon(Icons.arrow_forward,color: AppColors.primaryColor,),
                // )
              ],
            ),
          )
        ],
      ),
    );
  }
}
