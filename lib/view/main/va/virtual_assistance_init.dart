import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wurkfux/constants/colors.dart';
import 'package:wurkfux/constants/strings.dart';
import 'package:wurkfux/view/utilities/size_config.dart';
import 'package:wurkfux/view/widgets/spacing.dart';

class VirtualAssistantForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AssistantForm();
}

class _AssistantForm extends State<VirtualAssistantForm> {
  String? selectedService, units, amount, duration, description;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
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
          'Virtual Assistant',
          style: TextStyle(
              color: AppColors.black,
              fontWeight: FontWeight.w700,
              fontFamily: AppStrings.poppinsFont,
              fontSize: 24.0),
        ),
        elevation: 0.0,
        actions: [
          Align(
            child: InkWell(
              splashColor: AppColors.primaryColor.withOpacity(0.5),
              onTap: () {},
              child: Container(
                height: 30.0,
                padding: EdgeInsets.only(left: 8.0, right: 8.0),
                margin: const EdgeInsets.only(right: 16.0),
                decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(20.0)),
                child: Row(
                  children: [
                    Icon(Icons.forum_outlined, size: 14),
                    Spacing.tinyWidth(),
                    Text(
                      "Chat Admin",
                      style: TextStyle(
                        fontSize: 12.0,
                        color: AppColors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
          physics: BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                height: 200.0,
                width: SizeConfig.screenWidth,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                          'https://www.c3itservices.com/images/va.jpeg'),
                      fit: BoxFit.cover),
                ),
              ),
              Spacing.largeHeight(),
              Padding(
                padding: EdgeInsets.only(
                  left: 20.0,
                  right: 20.0,
                ),
                child: buildInputField(
                    'Select Service',
                    selectedService,
                    'Select '
                        'Service',
                    TextInputType.text),
              ),
              Spacing.mediumHeight(),
              Padding(
                padding: EdgeInsets.only(
                  left: 20.0,
                  right: 20.0,
                ),
                child: buildInputField('Enter Units', units, 'Number of units',
                    TextInputType.number),
              ),
              Spacing.mediumHeight(),
              Padding(
                padding: EdgeInsets.only(
                  left: 20.0,
                  right: 20.0,
                ),
                child: buildInputField(
                    'Enter Duration', duration, 'Duration', TextInputType.text),
              ),
              Spacing.mediumHeight(),
              Padding(
                padding: EdgeInsets.only(
                  left: 20.0,
                  right: 20.0,
                ),
                child: buildInputField(
                    '', amount, 'Amount(Read Only)', TextInputType.text,
                    enabled: false),
              ),
              Spacing.mediumHeight(),
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
                    onSaved: (value) => description = value,
                    decoration: InputDecoration(
                      fillColor: AppColors.lightGrey,
                      border: new OutlineInputBorder(
                          borderSide: new BorderSide(color: Colors.teal)),
                      hintText: 'Kindly describe what you want (placeholder)',
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
                  child: TextButton.icon(
                    onPressed: () {
                      // Respond to button press
                    },
                    icon: Icon(Icons.attach_file, size: 18),
                    label: Text("Attach a document"),
                  ),
                ),
              ),
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

TextFormField buildInputField(
    String errorMessage, String? variable, String hint, TextInputType type,
    {bool enabled = true}) {
  return TextFormField(
    enabled: enabled,
    autovalidateMode: AutovalidateMode.onUserInteraction,
    keyboardType: type,
    validator: (value) {
      if (value == null || value.isEmpty) {
        return errorMessage;
      }
      return null;
    },
    onSaved: (value) => variable = value,
    decoration: InputDecoration(
      border: new OutlineInputBorder(
          borderSide: new BorderSide(color: Colors.teal)),
      hintText: hint,
    ),
  );
}
