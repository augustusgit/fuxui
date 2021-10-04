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
    SizeConfig().init(context);
    return Scaffold(
      appBar: createAppBar(context),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          padding: const EdgeInsets.only(right: 20.0, left: 20.0, bottom: 20.0),
          child: Container(
            height: SizeConfig.screenHeight,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  height: 200.0,
                  width: SizeConfig.screenWidth,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage('https://img.freepik'
                            '.com/free-vector/graphic-design-colorful-geometrical-lettering_52683-34588.jpg?size=626&ext=jpg'),
                        fit: BoxFit.cover),
                  ),
                ),
                Spacing.bigHeight(),
                Text(
                  'Project Name',
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
                  style: TextStyle(color: AppColors.gigDescriptionContent),
                ),
                Spacing.bigHeight(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      AppStrings.Pricing,
                      style: TextStyle(color: AppColors.gigDescriptionText),
                    ),
                    Text(
                      'Duration',
                      style: TextStyle(color: AppColors.gigDescriptionText),
                    ),
                  ],
                ),
                Spacing.mediumHeight(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('\$300', style: AppStyles.heading5),
                    Text("3 Months"),
                  ],
                ),
                Expanded(
                  child: Align(
                    alignment: FractionalOffset.bottomCenter,
                    child: Center(
                      child: continueButton(
                          () {},
                          getProportionateScreenWidth(20),
                          AppStrings.ProceedToPay),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  AppBar createAppBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      automaticallyImplyLeading: false,
      backgroundColor: Colors.white,
      flexibleSpace: SafeArea(
        child: Container(
          padding: EdgeInsets.only(right: 16),
          child: Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 12),
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
                      AppImages.shortArrowLeft,
                    ),
                  ),
                ),
              ),
              Spacing.mediumWidth(),
              Expanded(
                child: Container(
                  child: Text(
                    'Project Name',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontFamily: AppStrings.poppinsFont,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              /* Icon(
              Icons.settings,
              color: Colors.black54,
            ),*/
            ],
          ),
        ),
      ),
    );
  }
}
