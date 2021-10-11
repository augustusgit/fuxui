import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wurkfux/constants/colors.dart';
import 'package:wurkfux/constants/strings.dart';
import 'package:wurkfux/view/utilities/size_config.dart';
import 'package:wurkfux/view/widgets/continue_button.dart';
import 'package:wurkfux/view/widgets/google_button.dart';
import 'package:wurkfux/view/widgets/spacing.dart';

import 'login_form.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, () {
        Navigator.pop(context);
      }),
      body: LoginBody(),
    );
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
                "assets/svgs/short_arrow_left.svg",
              ),
            ),
          ),
        ));
  }
}

class LoginBody extends StatelessWidget {
  // const SignUpBody({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();

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
          LoginForm(
            formKey: _formKey,
          ),
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
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, AppStrings.ForgotPasswordRoute);
            },
            child: Text(
              AppStrings.Forgot,
              style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w600),
            ),
          ),
          SizedBox(
            height: getProportionateScreenHeight(80),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                continueButton(() {
                  if (_formKey.currentState!.validate()) {
                    //Login here
                  }
                }, 16.0, AppStrings.Continue),
                SizedBox(
                  height: getProportionateScreenHeight(23.0),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 43),
                  child: createGoogleButton(() {
                    if (_formKey.currentState!.validate()) {
                      //Login here
                    }
                  }, AppStrings.WithGoogle),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
