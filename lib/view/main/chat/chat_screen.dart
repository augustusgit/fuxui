import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wurkfux/constants/colors.dart';
import 'package:wurkfux/constants/strings.dart';
import 'package:wurkfux/view/utilities/size_config.dart';
import 'package:wurkfux/view/widgets/spacing.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  _ChatDetailScreenState createState() => _ChatDetailScreenState();
}

class _ChatDetailScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: createAppBar(context, () {}),
      body: ChatDetailBody(),
    );
  }
}

class ChatDetailBody extends StatelessWidget {
  const ChatDetailBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
          child: Column(),
        ),
        CustomChatTextInput()
      ],
    );
  }
}

class CustomChatTextInput extends StatelessWidget {
  const CustomChatTextInput({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10),
        height: getProportionateScreenHeight(75),
        decoration: BoxDecoration(
            border: Border(
          top: BorderSide(width: 1.0, color: AppColors.grey),
        )),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Row(
            children: [
              GestureDetector(
                onTap: () {},
                child: SvgPicture.asset(
                  "assets/svgs/image_icon.svg",
                  height: getProportionateScreenHeight(18.0),
                  width: getProportionateScreenWidth(18.0),
                ),
              ),
              Spacing.mediumWidth(),
              Expanded(
                child: TextField(
                    decoration: InputDecoration(
                        hintText: AppStrings.TypeSomething,
                        hintStyle: TextStyle(
                          color: AppColors.gigDescriptionText,
                        ))),
              ),
              Spacing.smallWidth(),
              GestureDetector(
                onTap: () {},
                child: SvgPicture.asset(
                  "assets/svgs/send_message_icon.svg",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

AppBar createAppBar(BuildContext context, Function backPressed) {
  var name = "Queen Catherina";
  return AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
    title: Text(
      name,
      style: TextStyle(
          fontSize: getProportionatefontSize(18), fontWeight: FontWeight.w400),
    ),
    leading: IconButton(
        padding: EdgeInsets.only(left: getProportionateScreenWidth(30)),
        onPressed: () {
          Navigator.pop(context);
        },
        icon: SvgPicture.asset("assets/svgs/small_left_arrow.svg")),
    actions: [
      IconButton(
          padding: EdgeInsets.only(right: getProportionateScreenWidth(30)),
          onPressed: () {},
          icon: SvgPicture.asset("assets/svgs/plus_icon.svg"))
    ],
  );
}
