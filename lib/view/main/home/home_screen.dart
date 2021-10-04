import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wurkfux/constants/colors.dart';
import 'package:wurkfux/constants/images.dart';
import 'package:wurkfux/constants/strings.dart';
import 'package:wurkfux/view/utilities/size_config.dart';
import 'package:wurkfux/view/widgets/spacing.dart';

import 'orders_row.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _Home();
}

class _Home extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
            padding: const EdgeInsets.only(left: 30.0, right: 30.0),
            physics: BouncingScrollPhysics(),
            child: Container(
              height: SizeConfig.screenHeight,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Spacing.height(kToolbarHeight),
                  Container(
                    child: Text(
                      '${AppStrings.WelcomeHome} Sahm,',
                      style: TextStyle(
                        fontSize: 24.0,
                        fontFamily: AppStrings.poppinsFont,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Container(
                    child: Text(
                      'How can we be of help today?',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontFamily: AppStrings.poppinsFont,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                  Spacing.bigHeight(),
                  _orderSummaryContainer('20,000'),
                  Spacing.bigHeight(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [_oneOffProject(), _virtualAssistant()],
                  ),
                  Spacing.bigHeight(),
                  OrdersRow(),
                  Spacing.extraLargHeight(),
                ],
              ),
            )),
      ),
    );
  }

  Widget _orderSummaryContainer(String total) {
    return Container(
      height: 150.0,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: AppColors.primaryColor),
      child: Stack(
        children: <Widget>[
          SvgPicture.asset(
            AppImages.orderSummaryBackground,
            fit: BoxFit.cover,
            color: AppColors.white.withOpacity(0.35),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  AppStrings.OrdersSum,
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.normal,
                      color: AppColors.white,
                      fontSize: 14.0,
                      fontFamily: AppStrings.poppinsFont),
                ),
                RichText(
                  text: TextSpan(children: [
                    TextSpan(
                      text: "\$",
                      style: TextStyle(
                        color: AppColors.white,
                        fontFamily: AppStrings.poppinsFont,
                        fontWeight: FontWeight.w700,
                        fontStyle: FontStyle.normal,
                        fontSize: 18.0,
                      ),
                    ),
                    TextSpan(
                      text: total,
                      style: TextStyle(
                        color: AppColors.white,
                        fontFamily: AppStrings.poppinsFont,
                        fontWeight: FontWeight.w700,
                        fontStyle: FontStyle.normal,
                        fontSize: 24.0,
                      ),
                    ),
                  ]),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _oneOffProject() {
    return Padding(
      padding: const EdgeInsets.only(left: 22),
      child: Container(
          child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(8.0),
            height: getProportionateScreenHeight(80.0),
            width: getProportionateScreenWidth(80.0),
            decoration: BoxDecoration(
              color: AppColors.lightGrey,
              shape: BoxShape.circle,
            ),
            child: IconButton(
              onPressed: () {
                Navigator.pushNamed(context, AppStrings.ServicesRoute);
              },
              icon: SvgPicture.asset(
                AppImages.oneOffProject,
              ),
            ),
          ),
          Text(
            'One-off Projects',
            style: TextStyle(
                fontFamily: AppStrings.poppinsFont,
                fontSize: 16.0,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w400),
          )
        ],
      )),
    );
  }

  Widget _virtualAssistant() {
    return Padding(
      padding: const EdgeInsets.only(left: 22),
      child: Container(
          child: Column(
        children: [
          Container(
            height: getProportionateScreenHeight(80.0),
            width: getProportionateScreenWidth(80.0),
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: AppColors.lightGrey,
              shape: BoxShape.circle,
            ),
            child: IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                AppImages.virtualAssistant,
              ),
            ),
          ),
          Text(
            'Virtual Assistant',
            style: TextStyle(
                fontFamily: AppStrings.poppinsFont,
                fontSize: 16.0,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w400),
          )
        ],
      )),
    );
  }
}
