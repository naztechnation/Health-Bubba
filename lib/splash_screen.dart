import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:healthbubba/presentation/profile/profile_setup.dart';

import '../../res/app_images.dart';
import '../res/app_routes.dart';
import '../utils/navigator/page_navigator.dart';
import 'handlers/secure_handler.dart';
import 'presentation/dashboard/dashboard.dart';
import 'presentation/onboarding/onboard.dart';
import 'presentation/profile/work_information.dart';
import 'res/app_colors.dart'; 
import 'widgets/image_view.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  startTimeout() {
    return Timer(const Duration(seconds: 5), handleTimeout);
  }

  late AnimationController _animationController;

  void handleTimeout() {
    changeScreen();
  }

  String userType = '';
  String userLoggedIn = '';
  String isonBoarding = '';

  getUserDetails() async {
    userType = await StorageHandler.getUserType();
    userLoggedIn = await StorageHandler.getLoggedInState();
    isonBoarding = await StorageHandler.getOnBoardState();
  }

  Future<void> changeScreen() async {
    if (isonBoarding == '') {
      AppNavigator.pushAndReplacePage(context, page: OnboardScreen());
    } else if (userLoggedIn == '') {
      //AppNavigator.pushAndStackPage(context, page: const WorkInformation());

      AppNavigator.pushAndReplaceName(context, name: AppRoutes.signInScreen);
    } else {
      //AppNavigator.pushAndReplaceName(context, name: AppRoutes.signInScreen);

      //  AppNavigator.pushAndStackPage(context, page: const WorkInformation());
      

      AppNavigator.pushAndReplacePage(context, page: const Dashboard());
    }

    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
  }

  @override
  void initState() {
    getUserDetails();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1700),
    )..forward();
    super.initState();
    startTimeout();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.lightPrimary,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Align(
            child: ImageView.svg(
              AppImages.appLogo1,
              fit: BoxFit.fitWidth,
              height: 44.63,
            ),
          ),
        ],
      ),
    );
  }
}
