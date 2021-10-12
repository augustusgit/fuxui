import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wurkfux/constants/colors.dart';
import 'package:wurkfux/constants/strings.dart';
import 'package:wurkfux/view/utilities/size_config.dart';
import 'package:wurkfux/view/widgets/spacing.dart';

class ProjectDetails extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _Details();
}

class _Details extends State<ProjectDetails> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0.0,
        automaticallyImplyLeading: true,
        leading: IconButton(
          icon: Icon(
            Icons.chevron_left,
            color: AppColors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Details',
          style: TextStyle(
            fontSize: 24.0,
            fontFamily: AppStrings.poppinsFont,
            color: AppColors.black,
          ),
        ),
      ),
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
                      fontSize: getProportionatefontSize(20),
                      fontFamily: AppStrings.poppinsFont,
                      fontWeight: FontWeight.w700),
                ),
                Spacing.mediumHeight(),
                Text(
                  AppStrings.GigContent,
                  softWrap: true,
                  style: TextStyle(
                      color: AppColors.gigDescriptionText,
                      fontFamily: AppStrings.poppinsFont,
                      fontSize: 16.0),
                ),
                Spacing.bigHeight(),
                Text(
                  AppStrings.GetAQuote,
                  softWrap: true,
                  style: TextStyle(
                      color: AppColors.gigDescriptionText,
                      fontFamily: AppStrings.poppinsFont,
                      fontSize: 16.0),
                ),
                Spacing.bigHeight(),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      AppStrings.RequestAQuote,
                      style: TextStyle(
                          fontFamily: AppStrings.poppinsFont,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal),
                    ),
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(180, 50),
                      primary: AppColors.darkPrimaryColor,
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(20.0),
                      ),
                      onPrimary: AppColors.white,
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
}
