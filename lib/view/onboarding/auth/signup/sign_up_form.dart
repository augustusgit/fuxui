import 'package:flutter/material.dart';
import 'package:wurkfux/constants/colors.dart';
import 'package:wurkfux/constants/strings.dart';
import 'package:wurkfux/view/utilities/size_config.dart';
import 'package:wurkfux/view/widgets/custom_form_fields.dart';
import 'package:wurkfux/view/widgets/spacing.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({Key? key, required this.formKey}) : super(key: key);
  final GlobalKey formKey;

  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  String? _userName, _email, _password, _phoneNumber;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppStrings.EmailAddressHint,
            style: TextStyle(
                fontSize: getProportionatefontSize(11),
                color: AppColors.formFieldLabel,
                fontWeight: FontWeight.bold),
          ),
          buildEmailField(AppStrings.EmailError, _email),
          Spacing.mediumHeight(),
          Text(
            AppStrings.UserNameHint,
            style: TextStyle(
                fontSize: getProportionatefontSize(11),
                color: AppColors.formFieldLabel,
                fontWeight: FontWeight.bold),
          ),
          buildNameField(AppStrings.UserNameError, _userName),
          Spacing.mediumHeight(),
          Text(
            AppStrings.PhoneHint,
            style: TextStyle(
                fontSize: getProportionatefontSize(11),
                color: AppColors.formFieldLabel,
                fontWeight: FontWeight.bold),
          ),
          buildPhoneField(AppStrings.PhoneError, _phoneNumber),
          Spacing.mediumHeight(),
          Text(
            AppStrings.PasswordHint,
            style: TextStyle(
                fontSize: getProportionatefontSize(11),
                color: AppColors.formFieldLabel,
                fontWeight: FontWeight.bold),
          ),
          buildPasswordField(AppStrings.PasswordError, _password),
          Spacing.mediumHeight()
        ],
      ),
    );
  }
}
