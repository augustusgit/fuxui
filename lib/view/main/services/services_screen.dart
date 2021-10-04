import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wurkfux/constants/colors.dart';
import 'package:wurkfux/constants/images.dart';
import 'package:wurkfux/constants/strings.dart';
import 'package:wurkfux/view/utilities/size_config.dart';
import 'package:wurkfux/view/widgets/spacing.dart';

class ServicesScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _Services();
}

class _Services extends State<ServicesScreen> {
  final services = List.generate(
    20,
    (index) => index.isEven
        ? TextButton(
            onPressed: () {},
            child: Text(
              'Assignments',
              textAlign: TextAlign.start,
              style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w500,
                  fontFamily: AppStrings.poppinsFont,
                  fontStyle: FontStyle.normal),
            ),
          )
        : TextButton(
            onPressed: () {},
            child: Text(
              'Essays',
              textAlign: TextAlign.start,
              style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w500,
                  fontFamily: AppStrings.poppinsFont,
                  fontStyle: FontStyle.normal),
            ),
          ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: createAppBar(context),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(left: 30.0, right: 30.0),
          physics: BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: Container(
                  child: Text(
                    'Coming Soon',
                    style: TextStyle(
                      fontSize: 34.0,
                      fontFamily: AppStrings.poppinsFont,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              )
              /* ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemCount: services.length,
              itemBuilder: (_, index) => services[index],
            ),*/
            ],
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
                    AppStrings.Services,
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
