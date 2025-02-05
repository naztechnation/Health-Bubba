import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart'; 
import 'res/app_routes.dart';
import 'res/app_strings.dart';
import 'res/app_theme.dart';
import 'widgets/modals.dart';

class HealthBubba extends StatefulWidget {
  final String userLoggedIn;
  final String userFirstname;

  final GlobalKey<NavigatorState> navigatorKey;
  const HealthBubba({
    Key? key,
    required this.navigatorKey,
    required this.userLoggedIn, required this.userFirstname,
  }) : super(key: key);

  @override
  State<HealthBubba> createState() => _HealthBubbaState();
}

class _HealthBubbaState extends State<HealthBubba> with WidgetsBindingObserver {
   
  @override
  void initState() {
     
    super.initState();
  }
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
      initialRoute:
            (widget.userLoggedIn.isEmpty || widget.userLoggedIn == '')
                  ? AppRoutes.splashScreen
                  : (widget.userFirstname.isEmpty || widget.userFirstname == '') ? 
                  AppRoutes.signInScreen
                  : 
                  AppRoutes.dashboardScreen,
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
