import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wurkfux/constants/colors.dart';
import 'package:wurkfux/constants/images.dart';
import 'package:wurkfux/constants/strings.dart';
import 'package:wurkfux/view/utilities/size_config.dart';
import 'package:wurkfux/view/widgets/spacing.dart';
import 'package:wurkfux/view/wurk_fux_icons.dart';

import 'edit_profile_form.dart';

class EditUserProfile extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _EditProfile();
}

class _EditProfile extends State<EditUserProfile> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.all(0.0),
                child: Row(
                  children: [
                    Container(
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
                          AppImages.closeBig,
                        ),
                      ),
                    ),
                    Spacing.mediumWidth(),
                    Text(
                      AppStrings.EditProfileText,
                      style: TextStyle(
                        fontFamily: AppStrings.poppinsFont,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w400,
                        fontSize: 18.0,
                      ),
                    )
                  ],
                ),
              ),
              Spacing.bigHeight(),
              Align(
                alignment: Alignment.center,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: 160.0,
                      height: 160.0,
                      child: null,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: NetworkImage(AppImages.personPlaceholder3),
                          colorFilter: new ColorFilter.mode(
                              Color.fromRGBO(0, 0, 0, 0.5), BlendMode.darken),
                          fit: BoxFit.cover,
                        ),
                        color: AppColors.green,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset(
                        AppImages.camera,
                        color: AppColors.grey,
                      ),
                    )
                  ],
                ),
              ),
              Spacing.smallHeight(),
              EditForm(
                formFieldHint: AppStrings.FullNameHint,
                formLabelText: AppStrings.FullNameHint,
                formFileStartIcon: WurkFuxIcons.user,
                formFileEndIcon: null,
                suffixIconAction: null,
              ),
              EditForm(
                formFieldHint: 'Male',
                formLabelText: AppStrings.GenderHint,
                formFileStartIcon: null,
                formFileEndIcon: WurkFuxIcons.chevron_down,
                showEndIcon: true,
                suffixIconAction: () {},
              ),
              EditForm(
                formFieldHint: 'Philadelphia',
                formLabelText: AppStrings.CountryHint,
                formFileStartIcon: null,
                formFileEndIcon: WurkFuxIcons.chevron_down,
                showEndIcon: true,
                suffixIconAction: () {},
              ),
              EditForm(
                formFieldHint: '+234 83xxxxxxxxx',
                formLabelText: AppStrings.PhoneHint,
                formFileStartIcon: Icons.call,
                formFileEndIcon: null,
                showEndIcon: false,
                suffixIconAction: () {},
              ),
              EditForm(
                formFieldHint: '01-12-1992',
                formLabelText: AppStrings.DOBHint,
                formFileStartIcon: WurkFuxIcons.calendar,
                formFileEndIcon: null,
                showEndIcon: false,
                suffixIconAction: () {},
              ),
              Spacing.largeHeight(),
              Align(
                alignment: AlignmentDirectional.center,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        AppStrings.ApplyText,
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16.0,
                            color: AppColors.white,
                            fontFamily: AppStrings.poppinsFont,
                            fontStyle: FontStyle.normal),
                      ),
                      Spacing.largeWidth(),
                      Icon(
                        WurkFuxIcons.short_right,
                        color: AppColors.white,
                        size: 12.0,
                      ),
                    ],
                  ),
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size.fromHeight(50.0),
                    alignment: Alignment.center,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30.0)),
                    ),
                    padding: EdgeInsets.only(
                        top: 8.0, bottom: 8.0, left: 46.0, right: 46.0),
                  ),
                ),
              ),
              Padding(
                  // this is new
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom)),
            ],
          ),
        ),
      ),
    );
  }
}
