import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wurkfux/constants/colors.dart';
import 'package:wurkfux/constants/images.dart';
import 'package:wurkfux/constants/strings.dart';
import 'package:wurkfux/view/onboarding/auth/signup/sign_up_screen.dart';
import 'package:wurkfux/view/utilities/size_config.dart';
import 'package:wurkfux/view/widgets/continue_button.dart';
import 'package:wurkfux/view/widgets/spacing.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, () => Navigator.pop(context)),
      body: ForgotPasswordBody(),
    );
  }
}

class ForgotPasswordBody extends StatelessWidget {
  const ForgotPasswordBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Spacing.largeHeight(),
            Text(
              AppStrings.Forgot,
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.w600),
            ),
            Spacing.smallHeight(),
            Text(AppStrings.ForgotPassSub),
            Spacing.largeHeight(),
            ForgotPasswordForm(),
            Spacing.bigHeight(),
            Text(
              AppStrings.PhoneInstead,
              style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: getProportionateScreenHeight(140),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  continueButton(
                    () {
                      Navigator.pop(context);
                    },
                    16.0,
                    AppStrings.Continue,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: getProportionateScreenHeight(20.0),
            ),
          ],
        ),
      ),
    );
  }
}

class ForgotPasswordForm extends StatelessWidget {
  const ForgotPasswordForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppStrings.EmailAddressHint,
            style: TextStyle(
                fontSize: getProportionatefontSize(11),
                color: AppColors.formFieldLabel,
                fontWeight: FontWeight.bold),
          ),
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
                hintText: AppStrings.EmailAddressHint,
                icon: SvgPicture.asset(AppImages.mail)),
          ),
        ],
      ),
    );
  }
}
