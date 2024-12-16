// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:mvvm/repository/auth_repository.dart';
// import 'package:mvvm/utils/routes/routes_name.dart';
// import 'package:mvvm/utils/utils.dart';

// class AuthViewModel with ChangeNotifier {
//   final _myRepo = AuthRepository();

//   bool _loading = false;
//   bool get loading => _loading;

//   setLoading(bool value) {
//     _loading = value;
//     notifyListeners();
//   }

//   Future<void> loginApi(dynamic data, BuildContext context) async {
//     setLoading(true);
//     _myRepo.loginApi(data).then((value) {
//       setLoading(false);
//       Utils.toastMessage("Login Succesfully");
//       Navigator.pushNamed(context, RoutesName.home);
//       if (kDebugMode) {
//         print(value.toString());
//       }
//     }).onError((error, stackTrace) {
//       Utils.snackBar(error.toString(), context);
//       setLoading(false);
//       if (kDebugMode) {
//         print(error.toString());
//       }
//     });
//   }
// }
