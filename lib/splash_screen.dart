import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:healthbubba/presentation/auth/sign_in.dart';

import '../../res/app_images.dart';
import '../res/app_routes.dart';
import '../utils/navigator/page_navigator.dart';
import 'handlers/secure_handler.dart';
import 'presentation/dashboard/dashboard.dart';
import 'presentation/onboarding/onboard.dart'; 
import 'dart:io' show Platform;
import 'res/app_strings.dart';
import 'update_page.dart';
import 'widgets/image_view.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  startTimeout() {
    return Timer(const Duration(seconds: 7), handleTimeout);
  }
 

  void handleTimeout() {
    changeScreen();
  }

  
  String userLoggedIn = '';
  String isonBoarding = '';

  getUserDetails() async { 
    userLoggedIn = await StorageHandler.getLoggedInState();
    isonBoarding = await StorageHandler.getOnBoardState();
  }

  Future<void> changeScreen() async {
    if (isonBoarding == '') {
      AppNavigator.pushAndReplacePage(context, page: OnboardScreen());
    } else if (userLoggedIn == '') {

      AppNavigator.pushAndReplacePage(context, page: SignInScreen());
    } else {
      

      AppNavigator.pushAndReplacePage(context, page: const Dashboard());
    }

    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
  }

  void _checkVersionAndNavigate() {
     
if (Platform.isAndroid) {
  FirebaseFirestore.instance
        .collection('app_version_android')
        .doc('version_number_android')
        .snapshots()
        .listen((snapshot) {
      if (snapshot.exists) {
        final versionNumber = snapshot.data()?['current_version_android'] ?? '';
        if (versionNumber as int > AppStrings.appVersionAndroid) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const UpdateScreen()),
          );
        } else {
          
        }
      }
    });
} else if (Platform.isIOS) {
  FirebaseFirestore.instance
        .collection('app_version_ios')
        .doc('version_number_ios')
        .snapshots()
        .listen((snapshot) {
      if (snapshot.exists) {
        final versionNumber = snapshot.data()?['current_version_ios'] ?? '';
        if (versionNumber as int > AppStrings.appVersionIos) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const UpdateScreen()),
          );
        } else {
          
        }
      }
    });
}


     
  }

  @override
  void initState() {
    _checkVersionAndNavigate();
    getUserDetails();
     
    super.initState();
    startTimeout();
  }

  

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      backgroundColor: const Color(0xff0b372b),
      body: SizedBox(
        height: MediaQuery.sizeOf(context).height,
        child: const Align(
          child: ImageView.asset(
            AppImages.logoo,
            
          ),
        ),
      ),
    );
  }
}
