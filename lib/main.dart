import 'dart:convert';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:healthbubba/firebase_fcm.dart';
import 'package:healthbubba/main_page.dart';
import 'package:healthbubba/model/view_model/account_view_model.dart';
import 'package:healthbubba/model/view_model/book_appointment_viewmodel.dart';
import 'package:healthbubba/model/view_model/user_view_model.dart';
import 'package:provider/provider.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';
import 'package:zego_uikit_signaling_plugin/zego_uikit_signaling_plugin.dart';

import 'firebase_options.dart';
import 'handlers/secure_handler.dart';
import 'model/view_model/onboard_view_model.dart';

final navigatorKey = GlobalKey<NavigatorState>();

String userLoggedIn = '';

//final navigatorKey = GlobalKey();

Future _firebaseBackgroundMessage(RemoteMessage message) async {
  if (message.notification != null) {}
}


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
    userLoggedIn = await StorageHandler.getLoggedInState();

  FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
    if (message.notification != null) {
      //navigatorKey.currentState!.pushNamed(AppRoutes.message, arguments: message);
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
      // navigatorKey.currentState!.pushNamed(AppRoutes.message, arguments: message);
    });
  }
  
  ZegoUIKitPrebuiltCallInvitationService().setNavigatorKey(navigatorKey);
 
  ZegoUIKit().initLog().then((value) {
    ZegoUIKitPrebuiltCallInvitationService().useSystemCallingUI(
      [ZegoUIKitSignalingPlugin()],
    );

    runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => OnboardViewModel(), lazy: false),
        ChangeNotifierProvider(create: (_) => UserViewModel(), lazy: false),
        ChangeNotifierProvider(create: (_) => AccountViewModel(), lazy: false),
        ChangeNotifierProvider(
            create: (_) => BookAppointmentViewModel(), lazy: false),
      ],
      child: HealthBubba(navigatorKey: navigatorKey, userLoggedIn: userLoggedIn,),
    ));
  });

   
}

