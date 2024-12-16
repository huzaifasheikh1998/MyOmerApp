import 'package:flutter/material.dart';
import 'package:mvvm/repository/exercise_repo.dart';
import 'package:mvvm/utils/utils.dart';
import 'package:mvvm/view_model/exercise_view_model.dart';

class ExerciseWidgetViewModel with ChangeNotifier {
  final exerciseRepo = ExerciseRepo();
  final exerciseViewModel = ExerciseViewModel();
  reload() {
    print("reload>>>>>>>>>>>>>");
    notifyListeners();
  }

  Future<void> setNotification(
      int typeIndex, dynamic body, String notificationValue, index) async {
    exerciseRepo.setExerciseNotification(body).then((value) {
      print(body);
      print(value);
      print("type index$typeIndex");
      print(value["status"]);
      if (value["status"].toString() == "1") {
        switch (typeIndex) {
          case 0:
            print("exerciseViewModel index${exerciseViewModel.index}");
            if (notificationValue == "0") {
              exerciseEmotionalList[index].isNotify = "1";
            } else {
              exerciseEmotionalList[index].isNotify = "0";
            }
            break;
          case 1:
            print("exerciseViewModel index${exerciseViewModel.index}");
            if (notificationValue == "0") {
              exerciseBusinessList[index].isNotify = "1";
            } else {
              exerciseBusinessList[index].isNotify = "0";
            }
            break;
          case 2:
            print("exerciseViewModel index${exerciseViewModel.index}");
            if (notificationValue == "0") {
              exerciseRelationshipList[index].isNotify = "1";
            } else {
              exerciseRelationshipList[index].isNotify = "0";
            }
            break;
        }
        reload();
      }
    }).onError((error, stackTrace) {
      Utils.toastMessage(error.toString());
    });
  }
}
