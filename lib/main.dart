import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fitness_flutter/core/const/color_constants.dart';
import 'package:fitness_flutter/core/service/notification_service.dart';
import 'package:fitness_flutter/screens/onboarding/page/onboarding_page.dart';
import 'package:fitness_flutter/screens/tab_bar/page/tab_bar_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest.dart' as tz;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  static late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = NotificationService.flutterLocalNotificationsPlugin;

  @override
  initState() {
    super.initState();
    const AndroidInitializationSettings initializationSettingsAndroid = AndroidInitializationSettings('app_icon');
    final IOSInitializationSettings initializationSettingsIOS = IOSInitializationSettings();
    final InitializationSettings initializationSettings = InitializationSettings(android: initializationSettingsAndroid, iOS: initializationSettingsIOS);

    tz.initializeTimeZones();

    flutterLocalNotificationsPlugin.initialize(initializationSettings, onSelectNotification: selectNotification);
  }

  @override
  Widget build(BuildContext context) {
    final isLoggedIn = FirebaseAuth.instance.currentUser != null;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PulseFlow',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: ColorConstants.primaryColor,
        scaffoldBackgroundColor: ColorConstants.background,
        colorScheme: ColorScheme.dark(
          primary: ColorConstants.primaryColor,
          secondary: ColorConstants.accent,
          surface: ColorConstants.surface,
          background: ColorConstants.background,
          error: ColorConstants.errorColor,
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: ColorConstants.background,
          foregroundColor: ColorConstants.whiteOnDark,
          elevation: 0,
          centerTitle: false,
        ),
        textTheme: TextTheme(
          bodyText1: TextStyle(color: ColorConstants.whiteOnDark),
          bodyText2: TextStyle(color: ColorConstants.textGrey),
          headline6: TextStyle(color: ColorConstants.whiteOnDark, fontWeight: FontWeight.w700),
        ),
        fontFamily: 'NotoSansKR',
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: isLoggedIn ? TabBarPage() : OnboardingPage(),
    );
  }

  Future selectNotification(String? payload) async {
    showDialog(
      context: context,
      builder: (_) {
        return new AlertDialog(
          title: Text("PayLoad"),
          content: Text("Payload : $payload"),
        );
      },
    );
  }
}
