import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wurkfux/constants/colors.dart';
import 'package:wurkfux/constants/images.dart';
import 'package:wurkfux/view/utilities/size_config.dart';

Container createGoogleButton(Function clicked, String buttonText) {
  return Container(
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: AppColors.grey)),
    height: getProportionateScreenHeight(52),
    width: getProportionateScreenWidth(302),
    child: TextButton.icon(
      icon: SvgPicture.asset(AppImages.google),
      onPressed: () {
        clicked();
      },
      label: Text(
        buttonText,
        style: TextStyle(
            color: AppColors.black, fontSize: 16, fontWeight: FontWeight.w600),
      ),
      style: ButtonStyle(
          backgroundColor:
              MaterialStateColor.resolveWith((states) => AppColors.white),
          shape: MaterialStateProperty.resolveWith(
              (states) => RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ))),
    ),
  );
}
