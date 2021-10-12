import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wurkfux/constants/colors.dart';
import 'package:wurkfux/constants/strings.dart';
import 'package:wurkfux/view/widgets/spacing.dart';

class RequestModificationScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _RequestModification();
}

class _RequestModification extends State<RequestModificationScreen> {
  String? modifications;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
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
          'Request Modification',
          style: TextStyle(
              color: AppColors.black,
              fontWeight: FontWeight.w700,
              fontFamily: AppStrings.poppinsFont,
              fontSize: 24.0),
        ),
        elevation: 0.0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
          physics: BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Spacing.extraLargHeight(),
              Padding(
                  padding: EdgeInsets.only(
                    left: 20.0,
                    right: 20.0,
                  ),
                  child: TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    keyboardType: TextInputType.multiline,
                    minLines: 5,
                    maxLines: 100,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Kindly describe what you want';
                      }
                      return null;
                    },
                    onSaved: (value) => modifications = value,
                    decoration: InputDecoration(
                      fillColor: AppColors.lightGrey,
                      border: new OutlineInputBorder(
                          borderSide: new BorderSide(color: Colors.teal)),
                      hintText: 'Description\nWrite down your modifications  '
                          'here',
                    ),
                  )),
              Spacing.bigHeight(),
              Padding(
                padding: EdgeInsets.only(
                  left: 20.0,
                  right: 20.0,
                ),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      'Submit',
                      style: TextStyle(
                          fontFamily: AppStrings.poppinsFont,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal),
                    ),
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(150, 40),
                      primary: AppColors.darkPrimaryColor,
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(20.0),
                      ),
                      onPrimary: AppColors.white,
                    ),
                  ),
                ),
              ),
              Spacing.bigHeight(),
            ],
          ),
        ),
      ),
    );
  }
}
