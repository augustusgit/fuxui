import 'package:WurkFux/constants/colors.dart';
import 'package:WurkFux/constants/images.dart';
import 'package:WurkFux/constants/strings.dart';
import 'package:WurkFux/view/utilities/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  _navigateToHome() async {
    await Future.delayed(Duration(milliseconds: 3000), () {});
    Navigator.pushReplacementNamed(context, AppStrings.WelcomeRoute);
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SafeArea(
          child: Container(
        height: SizeConfig.screenHeight,
        width: SizeConfig.screenWidth,

        // Spacing.empty(),
        child: Center(
          child: AnimatedContainer(
              curve: Curves.decelerate,
              duration: const Duration(seconds: 3),
              child:
                  SvgPicture.asset(AppImages.appIcon) //Image.asset(assetName),
              ),
        ),
      )),
    );
  }
}
