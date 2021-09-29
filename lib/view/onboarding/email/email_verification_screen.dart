import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wurkfux/constants/strings.dart';
import 'package:wurkfux/view/onboarding/auth/signup/sign_up_screen.dart';
import 'package:wurkfux/view/utilities/size_config.dart';
import 'package:wurkfux/view/widgets/continue_button.dart';
import 'package:wurkfux/view/widgets/spacing.dart';

import 'otp_form.dart';

class EmailVerificationScreen extends StatelessWidget {
  const EmailVerificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        context,
        () => Navigator.pop(context),
      ),
      body: EmailVerificationBody(),
    );
  }
}

class EmailVerificationBody extends StatelessWidget {
  const EmailVerificationBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Spacing.bigHeight(),
            Text(
              AppStrings.EmailVerification,
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.w600),
            ),
            Spacing.smallHeight(),
            Text(AppStrings.EmailVerificationSub),
            Spacing.smallHeight(),
            Text(
              AppStrings.ResendCode,
              style: TextStyle(
                  fontSize: getProportionatefontSize(12),
                  fontWeight: FontWeight.w600),
            ),
            Spacing.largeHeight(),
            OtpForm(),
            Spacing.mediumHeight(),
            SizedBox(
              height: getProportionateScreenHeight(230),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  continueButton(() {
                    Navigator.pushNamedAndRemoveUntil(
                        context,
                        AppStrings.DashboardRoute,
                        (Route<dynamic> route) => false);
                  }),
                ],
              ),
            ),
            SizedBox(
              height: getProportionateScreenHeight(10.0),
            ),
          ],
        ),
      ),
    );
  }
}
