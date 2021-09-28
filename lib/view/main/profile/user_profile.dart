import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wurkfux/constants/colors.dart';
import 'package:wurkfux/constants/images.dart';
import 'package:wurkfux/constants/strings.dart';
import 'package:wurkfux/view/widgets/spacing.dart';
import 'package:wurkfux/view/wurk_fux_icons.dart';

class Profile extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _UserProfile();
}

class _UserProfile extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(
          left: 30.0,
          right: 30.0,
        ),
        physics: BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Spacing.height(kToolbarHeight * 1.5),
            Container(
              child: Text(
                AppStrings.ProfileHome,
                style: TextStyle(
                  fontSize: 24.0,
                  fontFamily: AppStrings.poppinsFont,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Spacing.largeHeight(),
            ProfileHeader(
                userImageUrl: AppImages.personPlaceholder3,
                userName: 'Desmond Chidi',
                userEmail: 'desmond.chidi@outlook.com'
                    '.com'),
            Spacing.largeHeight(),
            GroupHeader(
              text: AppStrings.MeLabel,
            ),
            ProfileOption(
              option: AppStrings.ChangePass,
              action: () {},
              icon: WurkFuxIcons.password,
            ),
            Spacing.largeHeight(),
            GroupHeader(
              text: AppStrings.ApplicationLabel,
            ),
            ProfileOption(
              option: AppStrings.Terms,
              action: () {},
              icon: WurkFuxIcons.flag_outline,
            ),
            ProfileOption(
              option: AppStrings.PP,
              action: () {},
              icon: WurkFuxIcons.user_pin,
            ),
            ProfileOption(
              option: AppStrings.Licenses,
              action: () {},
              icon: WurkFuxIcons.file_blank,
            ),
            Spacing.largeHeight(),
            GroupHeader(
              text: AppStrings.AccountLabel,
            ),
            ProfileOption(
              option: AppStrings.Logout,
              action: () {},
              icon: WurkFuxIcons.log_out,
            ),
          ],
        ),
      ),
    );
  }
}

class GroupHeader extends StatelessWidget {
  final String text;

  const GroupHeader({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        text,
        style: TextStyle(
            fontWeight: FontWeight.w500,
            fontFamily: AppStrings.poppinsFont,
            fontStyle: FontStyle.normal,
            fontSize: 14.0,
            color: AppColors.grey),
      ),
    );
  }
}

class ProfileHeader extends StatelessWidget {
  final String userImageUrl;
  final String userName;
  final String userEmail;

  const ProfileHeader({
    required this.userImageUrl,
    required this.userName,
    required this.userEmail,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 70.0,
          height: 70.0,
          child: null,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(userImageUrl),
              fit: BoxFit.cover,
            ),
            color: AppColors.green,
            borderRadius: BorderRadius.all(
              Radius.circular(50.0),
            ),
          ),
        ),
        Spacing.mediumWidth(),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              userName,
              style: TextStyle(
                  fontFamily: AppStrings.poppinsFont,
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.normal,
                  fontSize: 24.0,
                  color: AppColors.textColorPrimary),
            ),
            Spacing.empty(),
            Text(
              userEmail,
              style: TextStyle(
                  fontFamily: AppStrings.poppinsFont,
                  fontWeight: FontWeight.w600,
                  fontStyle: FontStyle.normal,
                  fontSize: 12.0,
                  color: AppColors.textColorPrimary),
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                AppStrings.EditProfileText,
                style: TextStyle(
                    fontSize: 14.0,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w400,
                    color: AppColors.grey),
              ),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.all(0.0),
              ),
            )
          ],
        )
      ],
    );
  }
}

class ProfileOption extends StatelessWidget {
  const ProfileOption({required this.option, this.action, required this.icon});

  final String option;
  final VoidCallback? action;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      child: TextButton(
        onPressed: action,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              children: [
                Container(
                  child: Text(
                    option,
                    style: TextStyle(
                      fontFamily: AppStrings.poppinsFont,
                      fontWeight: FontWeight.w400,
                      color: AppColors.textColorPrimary,
                      fontSize: 16.0,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                ),
              ],
            ),
            Container(
              alignment: AlignmentDirectional.centerEnd,
              child: Icon(
                icon,
                color: Colors.black,
                size: 18.0,
              ),
            ),
          ],
        ),
        style: ElevatedButton.styleFrom(
          fixedSize: Size.fromHeight(50.0),
        ),
      ),
    );
  }
}
