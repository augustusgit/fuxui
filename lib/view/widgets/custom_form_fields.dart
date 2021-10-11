import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wurkfux/constants/strings.dart';

TextFormField buildPasswordField(
    String errorMessage, String? passwordVariable) {
  return TextFormField(
    autovalidateMode: AutovalidateMode.onUserInteraction,
    obscureText: true,
    validator: (value) {
      if (value == null || value.isEmpty) {
        return errorMessage;
      }
      return null;
    },
    onSaved: (password) => passwordVariable = password,
    decoration: InputDecoration(
        hintText: AppStrings.PasswordHint,
        icon: SvgPicture.asset(
          "assets/svgs/loading.svg",
        )),
  );
}

TextFormField buildPhoneField(String errorMessage, String? phoneVariable) {
  return TextFormField(
    autovalidateMode: AutovalidateMode.onUserInteraction,
    keyboardType: TextInputType.phone,
    validator: (value) {
      if (value!.length < (11)) {
        return errorMessage;
      }
      return null;
    },
    onSaved: (phone) => phoneVariable = phone,
    decoration: InputDecoration(
        hintText: AppStrings.PhoneHint,
        icon: SvgPicture.asset("assets/svgs/phone.svg")),
  );
}

TextFormField buildNameField(String errorMessage, String? nameVariable) {
  return TextFormField(
    autovalidateMode: AutovalidateMode.onUserInteraction,
    keyboardType: TextInputType.name,
    validator: (value) {
      if (value == null || value.isEmpty) {
        return errorMessage;
      }
      return null;
    },
    onSaved: (name) => nameVariable = name,
    decoration: InputDecoration(
        hintText: AppStrings.UserNameHint,
        icon: SvgPicture.asset("assets/svgs/user.svg")),
  );
}

TextFormField buildEmailField(String errorMessage, String? emailVariable) {
  return TextFormField(
    autovalidateMode: AutovalidateMode.onUserInteraction,
    keyboardType: TextInputType.emailAddress,
    validator: (value) {
      if (value == null || value.isEmpty) {
        return errorMessage;
      }
      return null;
    },
    onSaved: (email) => emailVariable = email,
    decoration: InputDecoration(
        hintText: AppStrings.EmailAddressHint,
        icon: SvgPicture.asset("assets/svgs/mail.svg")),
  );
}
