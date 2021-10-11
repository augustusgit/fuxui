import 'package:WurkFux/constants/colors.dart';
import 'package:WurkFux/view/utilities/size_config.dart';
import 'package:WurkFux/view/widgets/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

SizedBox buildPaymentDetailButton(
    String buttonText, double buttonWidth, Function pressed) {
  return SizedBox(
    height: getProportionateScreenHeight(52),
    width: getProportionateScreenWidth(buttonWidth),
    child: ElevatedButton(
      onPressed: () {
        pressed();
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            buttonText,
            style: TextStyle(
                color: AppColors.onPrimaryColor,
                fontSize: 16,
                fontWeight: FontWeight.w600),
          ),
          Spacing.mediumWidth(),
          Container(
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.white, width: 1.4)),
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: SvgPicture.asset(
                  "assets/svgs/tick_good.svg",
                  fit: BoxFit.contain,
                ),
              ))
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
