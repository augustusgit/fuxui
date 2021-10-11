import 'package:flutter/material.dart';
import 'package:wurkfux/constants/colors.dart';
import 'package:wurkfux/constants/strings.dart';
import 'package:wurkfux/view/utilities/size_config.dart';
import 'package:wurkfux/view/widgets/custom_form_fields.dart';
import 'package:wurkfux/view/widgets/spacing.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key, required this.formKey}) : super(key: key);
  final GlobalKey formKey;

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  String? _email, _password;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppStrings.EmailAddressHint,
            style: TextStyle(
                fontSize: getProportionatefontSize(11),
                color: AppColors.formFieldLabel),
          ),
          buildEmailField(AppStrings.EmailError, _email),
          Spacing.mediumHeight(),
          Text(
            AppStrings.PasswordHint,
            style: TextStyle(
                fontSize: getProportionatefontSize(11),
                color: AppColors.formFieldLabel),
          ),
          buildPasswordField(AppStrings.PasswordError, _password),
          Spacing.mediumHeight()
        ],
      ),
    );
  }
}
