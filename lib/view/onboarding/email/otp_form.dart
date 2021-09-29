import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wurkfux/constants/colors.dart';
import 'package:wurkfux/view/utilities/size_config.dart';

class OtpForm extends StatefulWidget {
  const OtpForm({Key? key}) : super(key: key);

  @override
  _OtpFormState createState() => _OtpFormState();
}

class _OtpFormState extends State<OtpForm> {
  FocusNode? pin2Focus;
  FocusNode? pin3Focus;
  FocusNode? pin4Focus;
  FocusNode? pin5Focus;

  @override
  void initState() {
    super.initState();
    pin2Focus = FocusNode();
    pin3Focus = FocusNode();
    pin4Focus = FocusNode();
    pin5Focus = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    pin2Focus?.dispose();
    pin3Focus?.dispose();
    pin4Focus?.dispose();
    pin5Focus?.dispose();
  }

  void nextField(String value, FocusNode? focusNode, bool first, bool last) {
    if (value.isNotEmpty && last == false) {
      FocusScope.of(context).nextFocus();
    } else if (value.isEmpty && first == false) {
      FocusScope.of(context).previousFocus();
    } else
      pin5Focus?.unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: SizedBox(
        height: getProportionateScreenHeight(54.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            createOtpBox(pin2Focus, true, false),
            createOtpBox(pin3Focus, false, false),
            createOtpBox(pin4Focus, false, false),
            createOtpBox(pin5Focus, false, false),
            createOtpBox(pin5Focus, false, true),
          ],
        ),
      ),
    );
  }

  Container createOtpBox(FocusNode? nextBox, bool first, bool last) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: AppColors.verificationBoxBg),
      width: getProportionateScreenWidth(54.0),
      child: TextFormField(
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: '-',
          contentPadding: EdgeInsets.only(
            top: getProportionateScreenHeight(15),
          ),
        ),
        autofocus: true,
        style: TextStyle(
          fontSize: getProportionatefontSize(24.0),
          fontWeight: FontWeight.w400,
          decoration: null,
        ),
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        onChanged: (value) {
          setState(() {
            nextField(value, nextBox, first, last);
          });
        },
      ),
    );
  }
}
