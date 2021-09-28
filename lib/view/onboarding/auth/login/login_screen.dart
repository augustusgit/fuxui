import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wurkfux/constants/colors.dart';
import 'package:wurkfux/constants/strings.dart';
import 'package:wurkfux/view/utilities/size_config.dart';
import 'package:wurkfux/view/widgets/spacing.dart';

import 'login_form.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: SignInBody(),
    );
  }

  AppBar buildAppBar(BuildContext context) {
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
                Navigator.pop(context);
              },
              icon: SvgPicture.asset(
                "assets/svgs/short_arrow_left.svg",
              ),
            ),
          ),
        ));
  }
}

class SignInBody extends StatelessWidget {
  const SignInBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Spacing.extraLargHeight(),
          Text(
            AppStrings.Welcome,
            style: TextStyle(fontSize: 40, fontWeight: FontWeight.w600),
          ),
          Spacing.smallHeight(),
          Text(AppStrings.WelcomeSub),
          Spacing.largeHeight(),
          LoginForm(),
          Row(
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
                    "assets/svgs/tick_good.svg",
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Spacing.smallWidth(),
              Text(AppStrings.Remember),
            ],
          ),
          Spacing.bigHeight(),
          Text(
            AppStrings.Forgot,
            style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: getProportionateScreenHeight(80),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  height: getProportionateScreenHeight(52),
                  width: getProportionateScreenWidth(302),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          AppStrings.Login,
                          style: TextStyle(
                              color: AppColors.onPrimaryColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        ),
                        Spacing.mediumWidth(),
                        SvgPicture.asset("assets/svgs/short_arrow_right.svg")
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
                      icon: SvgPicture.asset("assets/svgs/google.svg"),
                      onPressed: () {},
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
}
