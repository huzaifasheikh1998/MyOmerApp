import 'package:mvvm/data/network/base_api_services.dart';
import 'package:mvvm/data/network/network_api_services.dart';
import 'package:mvvm/model/dairy_model/dairy_model.dart';
import 'package:mvvm/res/app_url.dart';

import '../model/aftb_model/aftb_model.dart';
import '../model/decision_model/decision_model.dart';

List<DecisionModel> decisionList = [];
List<AftbModel> AftbList = [];
List<DairyModel> diaryList = [];

class JournalRepo {
  BaseApiServices _apiServices = NetworkApiService();
  // List<DairyModel> dairyList = [];

  Future<List<DairyModel>> fetchDiaryList(body) async {
    try {
      dynamic data =
          await _apiServices.getPostApiResponse(AppUrl.dairyUrl, body);
      diaryList.clear();
      if (data["status"].toString() == "1") {
        dynamic response = data["response"];
        for (var item in response) {
          diaryList.add(DairyModel.fromJson(item));
        }
      }

      return diaryList;
    } catch (e) {
      throw e;
    }
  }

  Future setDairy(dynamic body) async {
    try {
      dynamic data =
          await _apiServices.getPostApiResponse(AppUrl.addDairyUrl, body);

      return data;
    } catch (e) {
      throw e;
    }
  }

  Future<List<DecisionModel>> fetchDecisionList(body) async {
    try {
      dynamic data =
          await _apiServices.getPostApiResponse(AppUrl.decisionUrl, body);
      decisionList.clear();
      if (data["status"].toString() == "1") {
        dynamic response = data["response"];
        for (var item in response) {
          decisionList.add(DecisionModel.fromJson(item));
        }
        // print(decisionList);
      }
      return decisionList;
    } catch (e) {
      throw e;
    }
  }

  Future setDecision(dynamic body) async {
    try {
      dynamic data =
          await _apiServices.getPostApiResponse(AppUrl.addDecisionUrl, body);

      return data;
    } catch (e) {
      throw e;
    }
  }

  Future<List<AftbModel>> fetchAftbList(body) async {
    try {
      dynamic data =
          await _apiServices.getPostApiResponse(AppUrl.allftbUrl, body);
      AftbList.clear();
      if (data["status"].toString() == "1") {
        dynamic response = data["response"];
        for (var item in response) {
          AftbList.add(AftbModel.fromJson(item));
        }
        // print(AftbList);
      }
      return AftbList;
    } catch (e) {
      throw e;
    }
  }

  Future setAftb(dynamic body) async {
    try {
      dynamic data =
          await _apiServices.getPostApiResponse(AppUrl.addAllftbUrl, body);

      return data;
    } catch (e) {
      throw e;
    }
  }
}
