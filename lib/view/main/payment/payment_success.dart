import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wurkfux/constants/colors.dart';
import 'package:wurkfux/constants/images.dart';
import 'package:wurkfux/constants/strings.dart';
import 'package:wurkfux/view/utilities/size_config.dart';
import 'package:wurkfux/view/widgets/spacing.dart';
import 'package:wurkfux/view/wurk_fux_icons.dart';

class PaymentFeedback extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _Success();
}

class _Success extends State<PaymentFeedback> {
  @override
  Widget build(BuildContext context) {
    Uint8List bytes =
        Base64Decoder().convert(AppImages.paymentSuccessIllustration);
    return Container(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(0.0),
            child: Container(
              height: getProportionateScreenHeight(45.0),
              width: getProportionateScreenWidth(45.0),
              decoration: BoxDecoration(
                color: AppColors.lightGrey,
                shape: BoxShape.circle,
              ),
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: SvgPicture.asset(
                  AppImages.closeBig,
                ),
              ),
            ),
          ),
          Spacing.bigHeight(),
          Text(
            AppStrings.PaymentSuccess,
            style: TextStyle(
              fontFamily: AppStrings.poppinsFont,
              fontSize: 40.0,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w600,
            ),
          ),
          Spacing.smallHeight(),
          Text(
            AppStrings.PaymentVerified,
            style: TextStyle(
              fontFamily: AppStrings.poppinsFont,
              fontSize: 16.0,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w400,
            ),
          ),
          Spacing.bigHeight(),
          Container(
            child: new Image.memory(bytes),
          ),
          Spacing.extraLargHeight(),
          Align(
            alignment: AlignmentDirectional.center,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    AppStrings.FinishText,
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16.0,
                        color: AppColors.white,
                        fontFamily: AppStrings.poppinsFont,
                        fontStyle: FontStyle.normal),
                  ),
                  Spacing.smallWidth(),
                  Icon(
                    WurkFuxIcons.circle_checked,
                    color: AppColors.white,
                    size: 16.0,
                  ),
                ],
              ),
              style: ElevatedButton.styleFrom(
                fixedSize: Size.fromHeight(50.0),
                alignment: Alignment.center,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30.0)),
                ),
                padding: EdgeInsets.only(
                    top: 8.0, bottom: 8.0, left: 46.0, right: 46.0),
              ),
            ),
          )
        ],
      ),
    );
  }
}
