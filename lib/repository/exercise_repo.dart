import 'package:mvvm/data/network/base_api_services.dart';
import 'package:mvvm/data/network/network_api_services.dart';
import 'package:mvvm/res/app_url.dart';

import '../model/exercise_model/exercise_model.dart';

List<ExerciseModel> exerciseEmotionalList = [];
List<ExerciseModel> exerciseBusinessList = [];
List<ExerciseModel> exerciseRelationshipList = [];

class ExerciseRepo {
  final BaseApiServices _apiServices = NetworkApiService();

  Future<List<ExerciseModel>> fetchExerciseList(dynamic body) async {
    try {
      dynamic data =
          await _apiServices.getPostApiResponse(AppUrl.exerciseUrl, body);

      exerciseBusinessList.clear();
      exerciseEmotionalList.clear();
      exerciseRelationshipList.clear();
      dynamic response = data["response"];
      for (var item in response) {
        switch (item["type"].toString()) {
          case "emotional":
            exerciseEmotionalList.add(ExerciseModel.fromJson(item));
            bool notiValue = item["is_notify"].toString() == "0" ? false : true;
            print("$notiValue notivalue");
            break;
          case "business":
            exerciseBusinessList.add(ExerciseModel.fromJson(item));
            break;
          case "relation":
            exerciseRelationshipList.add(ExerciseModel.fromJson(item));
            break;
        }
      }
      return exerciseEmotionalList;
    } catch (e) {
      throw e;
    }
  }

  Future setExerciseNotification(dynamic body) async {
    try {
      dynamic data = await _apiServices.getPostApiResponse(
          AppUrl.exerciseNotificationUrl, body);

      return data;
    } catch (e) {
      throw e;
    }
  }
}
