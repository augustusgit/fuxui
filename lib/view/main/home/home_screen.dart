import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wurkfux/constants/colors.dart';
import 'package:wurkfux/constants/strings.dart';
import 'package:wurkfux/view/utilities/size_config.dart';
import 'package:wurkfux/view/widgets/spacing.dart';

import 'carousel.dart';
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
            physics: BouncingScrollPhysics(),
            child: Container(
              height: SizeConfig.screenHeight,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Spacing.bigHeight(),
                  CarouselWithIndicator(),
                  Spacing.bigHeight(),
                  Padding(
                    padding: EdgeInsets.only(left: 20.0, right: 20.0),
                    child: OrdersRow(),
                  ),
                  Spacing.largeHeight(),
                  Padding(
                    padding: EdgeInsets.only(left: 20.0, right: 20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _oneOffProject(),
                        Spacing.mediumHeight(),
                        _virtualAssistant()
                      ],
                    ),
                  ),
                  Spacing.extraLargHeight()
                ],
              ),
            )),
      ),
    );
  }

  Widget _oneOffProject() {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, AppStrings.OneOffsRoute);
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: getProportionateScreenWidth(120.0),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(15.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black,
              blurRadius: 1.0,
              spreadRadius: 0.0,
              offset: Offset(-1.0, 1.0), // shadow direction: bottom right
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 80,
              height: 100,
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                backgroundColor: AppColors.primaryColor.withOpacity(0.2),
                child: Icon(
                  Icons.inventory_outlined,
                  color: AppColors.primaryColor,
                  size: 32,
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "One Off Project",
                      softWrap: true,
                      style: TextStyle(
                        fontFamily: AppStrings.poppinsFont,
                        color: AppColors.black,
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                      ),
                    ),
                    Spacing.smallHeight(),
                    Text(
                      'Quickly get your job done in short time',
                      softWrap: true,
                      style: TextStyle(
                        fontFamily: AppStrings.poppinsFont,
                        color: AppColors.black,
                        fontWeight: FontWeight.w300,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _virtualAssistant() {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, AppStrings.VirtualAssistantRoute);
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: getProportionateScreenWidth(120.0),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(15.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black,
              blurRadius: 1.0,
              spreadRadius: 0.0,
              offset: Offset(-1.0, 1.0), // shadow direction: bottom right
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 80,
              height: 100,
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                backgroundColor: AppColors.primaryColor.withOpacity(0.2),
                child: Icon(
                  Icons.touch_app_rounded,
                  color: AppColors.primaryColor,
                  size: 32,
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Virtual Assistant",
                      softWrap: true,
                      style: TextStyle(
                        fontFamily: AppStrings.poppinsFont,
                        color: AppColors.black,
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                      ),
                    ),
                    Spacing.smallHeight(),
                    Text(
                      'Get a virtual assistant assigned to you for a month '
                      'starting from \$500',
                      softWrap: true,
                      style: TextStyle(
                        fontFamily: AppStrings.poppinsFont,
                        color: AppColors.black,
                        fontWeight: FontWeight.w300,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
