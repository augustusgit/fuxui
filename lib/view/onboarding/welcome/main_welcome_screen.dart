import 'package:flutter/material.dart';
import 'package:wurkfux/constants/colors.dart';
import 'package:wurkfux/constants/strings.dart';
import 'package:wurkfux/view/utilities/size_config.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.darkPrimaryColor, body: WelcomeBody());
  }
}

class WelcomeBody extends StatelessWidget {
  const WelcomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Align(
        alignment: Alignment.topLeft,
        child: Container(
          margin: EdgeInsets.only(
              top: getProportionateScreenHeight(103),
              left: getProportionateScreenWidth(35)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppStrings.RealTimeService,
                style: TextStyle(
                  fontFamily: AppStrings.poppinsFont,
                  color: AppColors.onPrimaryColor,
                ),
              ),
              Text(
                AppStrings.appName.toLowerCase(),
                style: TextStyle(
                    color: AppColors.onPrimaryColor,
                    fontStyle: FontStyle.normal,
                    fontFamily: AppStrings.poppinsFont,
                    fontSize: getProportionatefontSize(50),
                    fontWeight: FontWeight.w900),
              ),
              RichText(
                text: TextSpan(
                    style: TextStyle(
                      fontFamily: AppStrings.poppinsFont,
                      color: AppColors.onPrimaryColor,
                      fontSize: 16,
                    ),
                    children: [
                      TextSpan(text: "Virtual Services\n"),
                      TextSpan(text: "On-Demand"),
                    ]),
              ),
            ],
          ),
        ),
      ),
      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(
              height: getProportionateScreenHeight(52),
              width: getProportionateScreenWidth(302),
              child: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, AppStrings.LoginRoute);
                },
                child: Text(
                  AppStrings.Login,
                  style: TextStyle(
                      fontFamily: AppStrings.poppinsFont,
                      color: AppColors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                style: ButtonStyle(
                    backgroundColor: MaterialStateColor.resolveWith(
                        (states) => AppColors.onPrimaryColor),
                    shape: MaterialStateProperty.resolveWith((states) =>
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)))),
              ),
            ),
            SizedBox(
              height: getProportionateScreenHeight(14.0),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 43),
              child: SizedBox(
                height: getProportionateScreenHeight(52),
                width: getProportionateScreenWidth(302),
                child: TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, AppStrings.SignUpRoute);
                  },
                  child: Text(
                    AppStrings.Signup,
                    style: TextStyle(
                        fontFamily: AppStrings.poppinsFont,
                        color: AppColors.onPrimaryColor,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600),
                  ),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateColor.resolveWith(
                          (states) => AppColors.signUpBtnBg),
                      shape: MaterialStateProperty.resolveWith((states) =>
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)))),
                ),
              ),
            ),
          ],
        ),
      )
    ]);
  }
}
