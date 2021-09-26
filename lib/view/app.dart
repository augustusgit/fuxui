import 'package:WurkFux/constants/colors.dart';
import 'package:WurkFux/constants/strings.dart';
import 'package:WurkFux/view/onboarding/splash.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppStrings.appName,
      onGenerateRoute: _routes(),
      theme: _theme(),
    );
  }

  RouteFactory _routes() {
    return (settings) {
      Widget screen;
      switch (settings.name) {
        case AppStrings.SplashRoute:
          screen = Splash();
          break;
        /*case AppStrings.WelcomeRoute:
          // Correct Place for this Statement
          //final arguments = settings.arguments as Map<String, dynamic>;
          screen = Welcome();
          break;*/
        default:
          return null;
      }
      return MaterialPageRoute(builder: (BuildContext context) => screen);
    };
  }

  ThemeData _theme() {
    return ThemeData(
        appBarTheme: AppBarTheme(),
        primarySwatch: Colors.green,
        primaryColor: AppColors.primaryColor,
        accentColor: AppColors.accent,
        scaffoldBackgroundColor: AppColors.backgroundColor,
        fontFamily: AppStrings.poppinsFont,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        primaryColorDark: AppColors.darkPrimaryColor);
  }
}