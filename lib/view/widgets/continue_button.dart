import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wurkfux/constants/colors.dart';
import 'package:wurkfux/constants/images.dart';
import 'package:wurkfux/constants/strings.dart';
import 'package:wurkfux/view/utilities/size_config.dart';
import 'package:wurkfux/view/widgets/spacing.dart';

SizedBox continueButton(Function clicked) {
  return SizedBox(
    height: getProportionateScreenHeight(52),
    width: getProportionateScreenWidth(302),
    child: ElevatedButton(
      onPressed: () {
        clicked();
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            AppStrings.Continue,
            style: TextStyle(
                color: AppColors.onPrimaryColor,
                fontSize: 16,
                fontWeight: FontWeight.w600),
          ),
          Spacing.mediumWidth(),
          SvgPicture.asset(AppImages.shortArrowRight)
        ],
      ),
      style: ButtonStyle(
          backgroundColor: MaterialStateColor.resolveWith(
              (states) => AppColors.primaryColor),
          shape: MaterialStateProperty.resolveWith((states) =>
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)))),
    ),
  );
}
