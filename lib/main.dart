import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:mvvm/res/color.dart';
import 'package:mvvm/utils/notification_services.dart';
import 'package:mvvm/utils/routes/routes_name.dart';
import 'package:mvvm/utils/routes/routes.dart';
import 'package:mvvm/utils/shared_pref.dart';
import 'package:mvvm/view_model/exercise_view_model.dart';
import 'package:mvvm/view_model/exercise_widget_view_model.dart';
import 'package:mvvm/view_model/home_view_model.dart';
import 'package:mvvm/view_model/journal_view_model.dart';
import 'package:mvvm/view_model/navbar_view_model.dart';
import 'package:mvvm/view_model/signIn_view_model.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

String loginId = "";
String tokenId = "";

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await getLoginId();
  // print("<<<<<<<<<<<<<<<<<<loginid main $loginId");
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  runApp(ChangeNotifierProvider(
    create: (context) => HomeViewModel(),
    child: MyApp(),
  ));
}

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print(message.notification!.title.toString());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  NotificationServices notificationServices = NotificationServices();
  @override
  void initState() {
    notificationServices.requestNotificationPermission();
    notificationServices.initFirebase();
    notificationServices.getDeviceToken().then((value) {
      tokenId = value;
      print("Device Token <<<<<<<<<<$tokenId>>>>>>>>>>>>");
    });
    notificationServices.isTokenRefresh();
    super.initState();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          // ChangeNotifierProvider(create: (_) => AuthViewModel()),
          ChangeNotifierProvider(create: (_) => NavbarViewModel()),
          ChangeNotifierProvider(create: (_) => HomeViewModel()),
          ChangeNotifierProvider(create: (_) => ExerciseViewModel()),
          ChangeNotifierProvider(create: (_) => ExerciseWidgetViewModel()),
          ChangeNotifierProvider(create: (_) => JournalViewModel()),
          ChangeNotifierProvider(create: (_) => SignInViewModel()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
              fontFamily: GoogleFonts.merriweather().fontFamily,
              splashColor: Colors.transparent,
              appBarTheme: AppBarTheme(color: AppColors.primaryColor),
              scrollbarTheme: ScrollbarThemeData(
                  thumbColor: MaterialStateProperty.all(AppColors.thirdColor))),
          initialRoute: loginId == null || loginId == "null" || loginId == ""
              ? RoutesName.getStarted
              : RoutesName.navbar,
          onGenerateRoute: Routes.generateRoute,
          // home: const LoginScreen()
        ));
  }
}
