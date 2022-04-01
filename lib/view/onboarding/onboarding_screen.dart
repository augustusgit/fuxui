import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:wurkfux/constants/colors.dart';
import 'package:wurkfux/constants/images.dart';
import 'package:wurkfux/constants/strings.dart';
import 'package:wurkfux/view/utilities/size_config.dart';
import 'package:wurkfux/view/widgets/custom_dots.dart';
import 'package:wurkfux/view/widgets/spacing.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

List<Map<String, String>> onboardingInfo = [
  {"description": AppStrings.OnBoardText1, "image": AppImages.onboarding1},
  {"description": AppStrings.OnBoardText2, "image": AppImages.onboarding2},
  {"description": AppStrings.OnBoardText3, "image": AppImages.onboarding3}
];

class _OnboardingScreenState extends State<OnboardingScreen> {
  int _currentPageValue = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Spacing.largeHeight(),
            Expanded(
              flex: 4,
              child: PageView.builder(
                physics: ClampingScrollPhysics(),
                itemCount: onboardingInfo.length,
                itemBuilder: (context, index) => OnBoardingItem(
                    image: onboardingInfo[index]["image"]!,
                    description: onboardingInfo[index]["description"]!),
                onPageChanged: (int page) {
                  getChangedPageAndMoveBar(page);
                },
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  Dots(slideIndex: _currentPageValue, numberOfDots: 3),
                  Spacing.mediumHeight(),
                  buildNextButton(() {
                    // if (_currentPageValue == 2) {
                      Navigator.pushNamed(context, AppStrings.WelcomeRoute);
                    // }
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Padding buildNextButton(Function onClicked) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: Container(
        decoration: BoxDecoration(
            color: _currentPageValue < 2
                ? AppColors.white
                : AppColors.primaryColor,
            borderRadius: BorderRadius.circular(30),
            border: _currentPageValue < 2
                ? Border.all(color: AppColors.primaryColor)
                : Border.all(color: Colors.transparent)),
        height: getProportionateScreenHeight(52),
        width: getProportionateScreenWidth(302),
        child: TextButton(
          onPressed: () {
            onClicked();
          },
          child: Text(
            _currentPageValue < 2 ? AppStrings.Next : AppStrings.GetStarted,
            style: TextStyle(
                color: _currentPageValue < 2
                    ? AppColors.primaryColor
                    : AppColors.onPrimaryColor,
                fontSize: 16,
                fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }

  void getChangedPageAndMoveBar(int page) {
    setState(() {
      _currentPageValue = page;
    });
  }
}

class OnBoardingItem extends StatelessWidget {
  final String image, description;

  const OnBoardingItem(
      {Key? key, required this.image, required this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Uint8List bytes = Base64Decoder().convert(image);

    return Column(
      children: [
        Spacing.height(100.0),
        Container(
          height: 400.0,
          child: new Image.memory(bytes),
        ),
        Spacing.bigHeight(),
        Text(
          description,
          style: TextStyle(
            color: AppColors.black,
            fontSize: getProportionatefontSize(36),
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}
