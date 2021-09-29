import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wurkfux/constants/colors.dart';
import 'package:wurkfux/constants/images.dart';
import 'package:wurkfux/constants/strings.dart';
import 'package:wurkfux/view/onboarding/auth/signup/sign_up_form.dart';
import 'package:wurkfux/view/utilities/size_config.dart';
import 'package:wurkfux/view/widgets/spacing.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, () => Navigator.pop(context)),
      body: SignUpBody(),
    );
  }
}

AppBar buildAppBar(BuildContext context, Function backPressed) {
  return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: Padding(
        padding: const EdgeInsets.only(left: 22),
        child: Container(
          height: getProportionateScreenHeight(45.0),
          width: getProportionateScreenWidth(45.0),
          decoration: BoxDecoration(
            color: AppColors.lightGrey,
            shape: BoxShape.circle,
          ),
          child: IconButton(
            onPressed: () {
              backPressed();
            },
            icon: SvgPicture.asset(
              AppImages.shortArrowLeft,
            ),
          ),
        ),
      ));
}

class SignUpBody extends StatelessWidget {
  const SignUpBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Spacing.largeHeight(),
          Text(
            AppStrings.GetStarted,
            style: TextStyle(fontSize: 40, fontWeight: FontWeight.w600),
          ),
          Spacing.smallHeight(),
          Text(AppStrings.WelcomeSub),
          Spacing.largeHeight(),
          SignUpForm(),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: getProportionateScreenHeight(24.0),
                width: getProportionateScreenWidth(24.0),
                decoration: BoxDecoration(
                  color: AppColors.darkPrimaryColor,
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset(
                    AppImages.tickGood,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Spacing.smallWidth(),
              Expanded(child: Text(AppStrings.Agreement))
            ],
          ),
          Spacing.bigHeight(),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  height: getProportionateScreenHeight(52),
                  width: getProportionateScreenWidth(302),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(
                          context, AppStrings.EmailVerificationRoute);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          AppStrings.Continue,
                          style: TextStyle(
                              color: AppColors.onPrimaryColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        ),
                        Spacing.mediumWidth(),
                        SvgPicture.asset(AppImages.shortArrowRight)
                      ],
                    ),
                    style: ButtonStyle(
                        backgroundColor: MaterialStateColor.resolveWith(
                            (states) => AppColors.primaryColor),
                        shape: MaterialStateProperty.resolveWith((states) =>
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30)))),
                  ),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(23.0),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 43),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(color: AppColors.grey)),
                    height: getProportionateScreenHeight(52),
                    width: getProportionateScreenWidth(302),
                    child: TextButton.icon(
                      icon: SvgPicture.asset(AppImages.google),
                      onPressed: () {
                        _goToDashboard(context);
                      },
                      label: Text(
                        AppStrings.WithGoogle,
                        style: TextStyle(
                            color: AppColors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                      style: ButtonStyle(
                          backgroundColor: MaterialStateColor.resolveWith(
                              (states) => AppColors.white),
                          shape: MaterialStateProperty.resolveWith(
                              (states) => RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ))),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _goToDashboard(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(
        context, AppStrings.DashboardRoute, (Route<dynamic> route) => false);
  }
}
