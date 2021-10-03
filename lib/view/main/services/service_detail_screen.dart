import 'package:WurkFux/constants/colors.dart';
import 'package:WurkFux/constants/images.dart';
import 'package:WurkFux/constants/strings.dart';
import 'package:WurkFux/constants/styles.dart';
import 'package:WurkFux/view/onboarding/customWidgets/continue_button.dart';
import 'package:WurkFux/view/utilities/size_config.dart';
import 'package:WurkFux/view/widgets/spacing.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wurkfux/constants/colors.dart';
import 'package:wurkfux/constants/images.dart';
import 'package:wurkfux/constants/strings.dart';
import 'package:wurkfux/constants/styles.dart';
import 'package:wurkfux/view/utilities/size_config.dart';
import 'package:wurkfux/view/widgets/continue_button.dart';
import 'package:wurkfux/view/widgets/spacing.dart';

class ServiceDetails extends StatelessWidget {
  const ServiceDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20))),
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(30)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BottomDialogBackArrow(),
              Spacing.mediumHeight(),
              SingleChildScrollView(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(AppImages.gigDetailImage),
                      Spacing.smallHeight(),
                      Text(
                        AppStrings.Assignment,
                        style: TextStyle(
                            fontSize: getProportionatefontSize(18),
                            fontWeight: FontWeight.bold),
                      ),
                      Spacing.smallHeight(),
                      Text(
                        AppStrings.Description,
                        style: TextStyle(color: AppColors.gigDescriptionText),
                      ),
                      Spacing.mediumHeight(),
                      Text(
                        AppStrings.GigContent,
                        style:
                            TextStyle(color: AppColors.gigDescriptionContent),
                      ),
                      Spacing.bigHeight(),
                      Text(
                        AppStrings.Pricing,
                        style: TextStyle(color: AppColors.gigDescriptionText),
                      ),
                      Spacing.mediumHeight(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('\$300', style: AppStyles.heading5),
                          Text("3 Months"),
                        ],
                      ),
                      Spacing.bigHeight(),
                      Center(
                        child: continueButton(
                            () {},
                            getProportionateScreenWidth(20),
                            AppStrings.ProceedToPay),
                      ),
                      Spacing.mediumHeight()
                    ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class BottomDialogBackArrow extends StatelessWidget {
  const BottomDialogBackArrow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: Align(
        alignment: Alignment.topLeft,
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
              AppImages.smallLeftArrow,
            ),
          ),
        ),
      ),
    );
  }
}
