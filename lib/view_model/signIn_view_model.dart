import 'package:flutter/material.dart';
import 'package:mvvm/main.dart';
import 'package:mvvm/repository/signin_repo.dart';
import 'package:mvvm/repository/token_repo.dart';
import 'package:mvvm/utils/routes/routes_name.dart';
import 'package:mvvm/utils/shared_pref.dart';
import 'package:mvvm/utils/utils.dart';

class SignInViewModel with ChangeNotifier {
  final signInRepo = SignInRepo();
  final tokenRepo = TokenRepo();
  bool _loading = false;
  bool get loading => _loading;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  Future<void> signInApi(dynamic body, BuildContext context) async {
    setLoading(true);
    Utils.toastMessage("loading");
    signInRepo.signApi(body).then((value) {
      var val = value.first;
      print(val["status"]);
      Utils.snackBar(val["message"], context);
      if (val["status"].toString() == "1" || val["status"].toString() == "2") {
        // final utils = Utils();
        String loginId = val["response"]["id"].toString();
        debugPrint("Login ID<<<<<<<<<<<<<<<<<$loginId>>>>>>>>>>>>>>");
        setLoginId(loginId).then((id) {
          print("<<<<<<<<<<<$id>>>>>>>>>>>");
          print("<<<<<<<<<<<<<<<<<$tokenId>>>>>>>>>>>>>>>>>");
          tokenRepo.tokenApi({"user_id": "$id", "fcm_token": tokenId});
        });
        // Utils.storeLoginId(loginId);
        Navigator.pushNamedAndRemoveUntil(
            context, RoutesName.navbar, (route) => false);
      }
      setLoading(false);
    }).onError((error, stackTrace) {
      Utils.snackBar(error.toString(), context);
      setLoading(false);
    });
  }
}
