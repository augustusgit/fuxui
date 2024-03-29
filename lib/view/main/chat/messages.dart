import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wurkfux/constants/colors.dart';
import 'package:wurkfux/constants/images.dart';
import 'package:wurkfux/constants/strings.dart';
import 'package:wurkfux/view/utilities/size_config.dart';
import 'package:wurkfux/view/widgets/spacing.dart';

class MessagesScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _Messages();
}

class _Messages extends State<MessagesScreen> {
  final messages = List.generate(
      12,
      (index) => index.isEven
          ? Messages(
              chatID: 1,
              userImageUrl: AppImages.personPlaceholder,
              userName: 'Queen Catherina',
              lastMessage: 'i’d like the prototype today please',
              lastMessageTimeStamp: '2m',
            )
          : Messages(
              chatID: 2,
              userImageUrl: AppImages.personPlaceholder2,
              userName: 'Thelma Boss',
              lastMessage: 'Download snap "figma-linux"....',
              lastMessageTimeStamp: '4m',
            ));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: createAppBar(
        context,
      ),
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
                itemCount: messages.length,
                itemBuilder: (_, index) => messages[index],
              ),
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
                    AppStrings.MessagesHome,
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

class Messages extends StatelessWidget {
  const Messages({
    required this.chatID,
    required this.userImageUrl,
    required this.userName,
    required this.lastMessage,
    required this.lastMessageTimeStamp,
  });

  final int chatID;
  final String userImageUrl;
  final String userName;
  final String lastMessage;
  final String lastMessageTimeStamp;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 8.0, bottom: 8.0),
        child: InkWell(
          onTap: () {
            Navigator.pushNamed(context, AppStrings.MailChatRoute);
          },
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Row(
              children: [
                Container(
                  width: 50.0,
                  height: 50.0,
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
                Spacing.smallWidth(),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      userName,
                      style: TextStyle(
                        fontFamily: AppStrings.poppinsFont,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w500,
                        color: AppColors.textColorPrimary,
                        fontSize: 18.0,
                      ),
                    ),
                    Text(
                      lastMessage,
                      style: TextStyle(
                        fontFamily: AppStrings.poppinsFont,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w400,
                        color: AppColors.textColorPrimary,
                        fontSize: 14.0,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Text(
              lastMessageTimeStamp,
              style: TextStyle(
                color: AppColors.grey,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w500,
                fontFamily: AppStrings.poppinsFont,
                fontSize: 14.0,
              ),
            ),
          ]),
        ));
  }
}
