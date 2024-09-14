import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import 'res/app_routes.dart';
import 'res/app_strings.dart';
import 'res/app_theme.dart';

class HealthBubba extends StatefulWidget {
  final GlobalKey<NavigatorState> navigatorKey;
  const HealthBubba({
    Key? key,
    required this.navigatorKey,
  }) : super(key: key);

  @override
  State<HealthBubba> createState() => _HealthBubbaState();
}

class _HealthBubbaState extends State<HealthBubba> with WidgetsBindingObserver {
   

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    return MaterialApp(
      navigatorKey: widget.navigatorKey,
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