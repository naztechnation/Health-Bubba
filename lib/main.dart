import 'dart:convert';



import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'model/view_model/onboard_view_model.dart';
import 'res/app_routes.dart';
import 'res/app_strings.dart';

 
 

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

   

  


  
  runApp(
    MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => OnboardViewModel(), lazy: false),
       
    ],
    child: const HealthBubba(),
  )

  
  );
}

class HealthBubba extends StatelessWidget {
  const HealthBubba({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppStrings.appName,
      themeMode: ThemeMode.light,
      theme: ThemeData(
        fontFamily: AppStrings.satoshi,
      ),
      routes: AppRoutes.routes,
      initialRoute: AppRoutes.splashScreen,
      onGenerateRoute: AppRoutes.generateRoute,
    );
  }
}
