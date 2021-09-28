import 'package:WurkFux/constants/strings.dart';
import 'package:WurkFux/view/widgets/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(AppStrings.EmailAddressHint),
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
                hintText: AppStrings.EmailAddressHint,
                icon: SvgPicture.asset("assets/svgs/mail.svg")),
          ),
          Spacing.mediumHeight(),
          Text(AppStrings.UserNameHint),
          TextFormField(
            keyboardType: TextInputType.name,
            decoration: InputDecoration(
                hintText: AppStrings.UserNameHint,
                icon: SvgPicture.asset("assets/svgs/user.svg")),
          ),
          Spacing.mediumHeight(),
          Text(AppStrings.PhoneHint),
          TextFormField(
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(
                hintText: AppStrings.PhoneHint,
                icon: SvgPicture.asset("assets/svgs/phone.svg")),
          ),
          Spacing.mediumHeight(),
          Text(AppStrings.PasswordHint),
          TextFormField(
            obscureText: true,
            decoration: InputDecoration(
                hintText: AppStrings.PasswordHint,
                icon: SvgPicture.asset(
                  "assets/svgs/loading.svg",
                )),
          ),
          Spacing.mediumHeight()
        ],
      ),
    );
  }
}
