import 'package:mvvm/data/network/base_api_services.dart';
import 'package:mvvm/data/network/network_api_services.dart';
import 'package:mvvm/model/daily_model/daily_model.dart';
import 'package:mvvm/model/weekly_model/weekly_model.dart';
import 'package:mvvm/res/app_url.dart';

import '../model/blessing_model/blessing_model.dart';
import '../model/monthly_model/monthly_model.dart';

class HomeRepo {
  final BaseApiServices _apiServices = NetworkApiService();
  List<DailyModel> dailyList = [];
  List<WeeklyModel> weeklyList = [];
  List<MonthlyModel> monthlyList = [];
  List<BlessingModel> blessingHumashList = [];
  List<BlessingModel> blessingTehilimList = [];
  List<BlessingModel> blessingTanyaList = [];
  Future<List<DailyModel>> fetchDailyList() async {
    try {
      dynamic data = await _apiServices.getGetApiResponse(AppUrl.dailyUrl);
      dailyList.clear();
      dynamic response = data["response"];
      for (var item in response) {
        dailyList.add(DailyModel.fromJson(item));
      }
      return dailyList;
    } catch (e) {
      throw e;
    }
  }

  Future<List<WeeklyModel>> fetchWeeklyList() async {
    try {
      dynamic data = await _apiServices.getGetApiResponse(AppUrl.weeklyUrl);
      weeklyList.clear();
      dynamic response = data["response"];
      for (var item in response) {
        weeklyList.add(WeeklyModel.fromJson(item));
      }
      return weeklyList;
    } catch (e) {
      throw e;
    }
  }

  Future<List<MonthlyModel>> fetchMonthlyList() async {
    try {
      dynamic data = await _apiServices.getGetApiResponse(AppUrl.monthlyUrl);
      monthlyList.clear();
      dynamic response = data["response"];
      for (var item in response) {
        monthlyList.add(MonthlyModel.fromJson(item));
      }
      return monthlyList;
    } catch (e) {
      throw e;
    }
  }

  Future<List<BlessingModel>> fetchBlessingList() async {
    try {
      dynamic data = await _apiServices.getGetApiResponse(AppUrl.blessingUrl);
      blessingHumashList.clear();
      blessingTanyaList.clear();
      blessingTehilimList.clear();
      dynamic response = data["response"];
      for (var item in response) {
        switch (item["type"].toString()) {
          case "humesh":
            blessingHumashList.add(BlessingModel.fromJson(item));
            break;
          case "tehilim":
            blessingTehilimList.add(BlessingModel.fromJson(item));
            break;
          case "tanya":
            blessingTanyaList.add(BlessingModel.fromJson(item));
            break;
        }
        // blessingList.add(BlessingModel.fromJson(item));
      }
      return blessingHumashList;
    } catch (e) {
      throw e;
    }
  }
}
