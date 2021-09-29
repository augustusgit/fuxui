import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wurkfux/constants/colors.dart';
import 'package:wurkfux/constants/strings.dart';
import 'package:wurkfux/view/main/dashboard.dart';
import 'package:wurkfux/view/onboarding/splash.dart';

import 'onboarding/auth/login/login_screen.dart';
import 'onboarding/auth/signup/sign_up_screen.dart';
import 'onboarding/email/email_verification_screen.dart';
import 'onboarding/forgot_pass/forgot_password.dart';

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
        case AppStrings.WelcomeRoute:
          // Correct Place for this Statement
          //final arguments = settings.arguments as Map<String, dynamic>;
          screen = Dashboard();
          break;
        case AppStrings.LoginRoute:
          screen = LoginScreen();
          break;
        case AppStrings.SignUpRoute:
          screen = SignUpScreen();
          break;
        case AppStrings.ForgotPasswordRoute:
          screen = ForgotPasswordScreen();
          break;
        case AppStrings.EmailVerificationRoute:
          screen = EmailVerificationScreen();
          break;
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
