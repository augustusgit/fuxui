import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:wurkfux/constants/colors.dart';
import 'package:wurkfux/constants/strings.dart';
import 'package:wurkfux/models/project.dart';
import 'package:wurkfux/view/widgets/spacing.dart';

class OneOffProjects extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _OneOffs();
}

class _OneOffs extends State<OneOffProjects> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
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
          'One Off Projects',
          style: TextStyle(
              color: AppColors.black,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w700,
              fontSize: 24.0),
        ),
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(left: 30.0, right: 30.0),
          physics: BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Spacing.largeHeight(),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemCount: projects.length,
                itemBuilder: (_, index) => InkWell(
                  splashColor: AppColors.darkPrimaryColor,
                  onTap: () {
                    Navigator.pushNamed(context, AppStrings.OneOffDetailsRoute);
                  },
                  child: Container(
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
                          width: 125.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15.0),
                              bottomLeft: Radius.circular(15.0),
                            ),
                            image: DecorationImage(
                                image: NetworkImage(
                                    projects[index].projectIllustration),
                                fit: BoxFit.cover),
                          ),
                        ),
                        Spacing.mediumWidth(),
                        Expanded(
                          child: Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  projects[index].projectName,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FontStyle.normal,
                                      fontFamily: AppStrings.poppinsFont,
                                      fontSize: 16.0),
                                ),
                                Spacing.smallHeight(),
                                Text(
                                  projects[index].projectDescription,
                                  style: TextStyle(
                                      color: AppColors.neutralGrey,
                                      fontWeight: FontWeight.w400,
                                      fontStyle: FontStyle.normal,
                                      fontFamily: AppStrings.poppinsFont,
                                      fontSize: 14.0),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
