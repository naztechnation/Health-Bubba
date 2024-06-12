import 'dart:convert';



import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:healthbubba/model/view_model/account_view_model.dart';
import 'package:healthbubba/model/view_model/book_appointment_viewmodel.dart';
import 'package:healthbubba/model/view_model/user_view_model.dart';
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
      ChangeNotifierProvider(create: (_) => UserViewModel(), lazy: false),
      ChangeNotifierProvider(create: (_) => AccountViewModel(), lazy: false),
      ChangeNotifierProvider(create: (_) => BookAppointmentViewModel(), lazy: false),
       
    ],
    child: const HealthBubba(),
  )

  
  );
}

class HealthBubba extends StatelessWidget {
  const HealthBubba({Key? key}) : super(key: key);

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
       
      routes: AppRoutes.routes,
      initialRoute: AppRoutes.splashScreen,
      onGenerateRoute: AppRoutes.generateRoute,
    );
  }
}
