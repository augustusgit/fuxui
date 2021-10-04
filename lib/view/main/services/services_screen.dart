import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wurkfux/constants/colors.dart';
import 'package:wurkfux/constants/images.dart';
import 'package:wurkfux/constants/strings.dart';
import 'package:wurkfux/models/project.dart';
import 'package:wurkfux/view/utilities/size_config.dart';
import 'package:wurkfux/view/widgets/spacing.dart';

class ServicesScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _Services();
}

class _Services extends State<ServicesScreen> {
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
              ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  itemCount: projects.length,
                  itemBuilder: (_, index) => InkWell(
                        splashColor: AppColors.darkPrimaryColor,
                        onTap: () {
                          Navigator.pushNamed(
                              context, AppStrings.ServiceDetailsRoute);
                        },
                        child: Stack(
                          alignment: Alignment.bottomRight,
                          children: [
                            Container(
                              height: 150.0,
                              margin: const EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                  10.0,
                                ),
                                color: AppColors.white,
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    width: 150.0,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(10.0),
                                        bottomLeft: Radius.circular(10.0),
                                      ),
                                      image: DecorationImage(
                                          image: NetworkImage(projects[index]
                                              .projectIllustration),
                                          fit: BoxFit.cover),
                                    ),
                                  ),
                                  Spacing.mediumWidth(),
                                  Expanded(
                                    child: Container(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            projects[index].projectName,
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontStyle: FontStyle.normal,
                                                fontFamily:
                                                    AppStrings.poppinsFont,
                                                fontSize: 16.0),
                                          ),
                                          Spacing.mediumHeight(),
                                          Text(
                                            projects[index].projectDescription,
                                            style: TextStyle(
                                                color: AppColors.neutralGrey,
                                                fontWeight: FontWeight.w400,
                                                fontStyle: FontStyle.normal,
                                                fontFamily:
                                                    AppStrings.poppinsFont,
                                                fontSize: 13.0),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: Container(
                                margin: const EdgeInsets.all(8.0),
                                child: Text(
                                  '\$${projects[index].projectCost}',
                                  style: TextStyle(
                                      color: AppColors.primaryColor,
                                      fontFamily: AppStrings.poppinsFont,
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            )
                          ],
                        ),
                      )),
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
