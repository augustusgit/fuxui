import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wurkfux/constants/colors.dart';
import 'package:wurkfux/constants/strings.dart';
import 'package:wurkfux/view/main/home/timeline.dart';
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
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 30.0, right: 30.0),
        physics: BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Spacing.height(kToolbarHeight * 1.5),
            Container(
              child: Text(
                AppStrings.WelcomeHome,
                style: TextStyle(
                  fontSize: 20.0,
                  fontFamily: AppStrings.poppinsFont,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Spacing.largeHeight(),
            _orderSummaryContainer('20,000'),
            Spacing.bigHeight(),
            OrdersRow(),
            Spacing.bigHeight(),
            Timeline()
          ],
        ),
      ),
    );
  }

  Widget _orderSummaryContainer(String total) {
    return Container(
      height: 100.0,
      decoration: BoxDecoration(
        color: AppColors.green,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              AppStrings.OrdersSum,
              style: TextStyle(
                  fontWeight: FontWeight.w400,
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
    );
  }
}
