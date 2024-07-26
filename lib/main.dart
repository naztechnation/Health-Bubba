import 'dart:convert';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthbubba/firebase_fcm.dart';
import 'package:healthbubba/model/view_model/account_view_model.dart';
import 'package:healthbubba/model/view_model/book_appointment_viewmodel.dart';
import 'package:healthbubba/model/view_model/user_view_model.dart';
import 'package:healthbubba/res/app_theme.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';
import 'model/view_model/onboard_view_model.dart';
import 'res/app_routes.dart';
import 'res/app_strings.dart';


final navigatorKey = GlobalKey<NavigatorState>();

 
Future _firebaseBackgroundMessage(RemoteMessage message) async {
  if (message.notification != null) {
    
  }
}
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
    if (message.notification != null) {
      
      navigatorKey.currentState!.pushNamed(AppRoutes.message, arguments: message);
    }
  });

  PushNotifications.init();
  PushNotifications.localNotiInit();
   
  FirebaseMessaging.onBackgroundMessage(_firebaseBackgroundMessage);

   
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    String payloadData = jsonEncode(message.data);
    
    if (message.notification != null) {
      PushNotifications.showSimpleNotification(
          title: message.notification!.title!,
          body: message.notification!.body!,
          payload: payloadData);
    }
  });

 
  final RemoteMessage? message =
      await FirebaseMessaging.instance.getInitialMessage();

  if (message != null) {
    Future.delayed(const Duration(seconds: 1), () {

      
      navigatorKey.currentState!.pushNamed(AppRoutes.message, arguments: message);
    });
  }
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => OnboardViewModel(), lazy: false),
      ChangeNotifierProvider(create: (_) => UserViewModel(), lazy: false),
      ChangeNotifierProvider(create: (_) => AccountViewModel(), lazy: false),
      ChangeNotifierProvider(
          create: (_) => BookAppointmentViewModel(), lazy: false),
    ],
    child: const HealthBubba(),
  ));
}

class HealthBubba extends StatefulWidget {
  const HealthBubba({Key? key}) : super(key: key);

  @override
  State<HealthBubba> createState() => _HealthBubbaState();
}

class _HealthBubbaState extends State<HealthBubba> with WidgetsBindingObserver{
   @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppStrings.appName,
      themeMode: ThemeMode.light,
      theme: themeData(AppTheme.lightTheme),
      routes: AppRoutes.routes,
      initialRoute: AppRoutes.splashScreen,
      onGenerateRoute: AppRoutes.generateRoute,
    );
  }

  ThemeData themeData(ThemeData theme) {
    return theme.copyWith(
        textTheme: GoogleFonts.interTextTheme(
          theme.textTheme,
        ),
        pageTransitionsTheme: const PageTransitionsTheme(
          builders: {
            TargetPlatform.android: ZoomPageTransitionsBuilder(),
            TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
          },
        ));
  }
}
