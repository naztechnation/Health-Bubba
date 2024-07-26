import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../presentation/auth/forgot_password.dart';
import '../presentation/auth/sign_in.dart';
import '../splash_screen.dart';

class AppRoutes {
  ///Route names used through out the app will be specified as static constants here in this format
  static const String splashScreen = 'splashScreen';
  static const String signInScreen = 'signInScreen';
  static const String signUpScreen = 'signUpScreen';
  static const String otpScreen = 'otpScreen';
  static const String successScreen = 'successScreen';
  static const String forgetPassword = 'forgetPassword';
  static const String resetPassword = 'resetPassword';
  static const String message = '/message';

 

  static Map<String, Widget Function(BuildContext)> routes = {
    ///Named routes to be added here in this format
    splashScreen: (context) => const SplashScreen(),
     forgetPassword: (context) =>   ForgotPassword(),
    // signUpScreen: (context) =>   SignUpScreen(),
     signInScreen: (context) =>   SignInScreen(),
   // message: (context) => Messages(),

    
  };

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashScreen:
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
        );
       case forgetPassword:
        return MaterialPageRoute(
          builder: (context) =>   ForgotPassword(),
        );
      
      case signInScreen:
        return MaterialPageRoute(
          builder: (context) =>   SignInScreen(),
        );

         
      
      
       
      //Default Route is error route
      default:
        return CupertinoPageRoute(
            builder: (context) => errorView(settings.name!));
    }
  }

  static Widget errorView(String name) {
    return Scaffold(body: Center(child: Text('404 $name View not found')));
  }
}
