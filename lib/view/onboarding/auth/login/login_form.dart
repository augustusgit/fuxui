import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wurkfux/constants/images.dart';
import 'package:wurkfux/constants/strings.dart';
import 'package:wurkfux/view/widgets/spacing.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(AppStrings.EmailAddressHint),
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              hintText: AppStrings.EmailAddressHint,
              icon: SvgPicture.asset(AppImages.mail),
            ),
          ),
          Spacing.mediumHeight(),
          Text(AppStrings.PasswordHint),
          TextFormField(
            obscureText: true,
            decoration: InputDecoration(
                hintText: AppStrings.PasswordHint,
                icon: SvgPicture.asset(
                  AppImages.loading,
                )),
          ),
          Spacing.mediumHeight()
        ],
      ),
    );
  }
}
