import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wurkfux/constants/strings.dart';
import 'package:wurkfux/view/widgets/spacing.dart';

class ServicesScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _Services();
}

class _Services extends State<ServicesScreen> {
  final services = List.generate(
    20,
    (index) => index.isEven
        ? TextButton(
            onPressed: () {},
            child: Text(
              'Assignments',
              textAlign: TextAlign.start,
              style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w500,
                  fontFamily: AppStrings.poppinsFont,
                  fontStyle: FontStyle.normal),
            ),
          )
        : TextButton(
            onPressed: () {},
            child: Text(
              'Essays',
              textAlign: TextAlign.start,
              style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w500,
                  fontFamily: AppStrings.poppinsFont,
                  fontStyle: FontStyle.normal),
            ),
          ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 30.0, right: 30.0),
        physics: BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Spacing.height(kToolbarHeight * 1.5),
            Container(
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
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemCount: services.length,
              itemBuilder: (_, index) => services[index],
            ),
          ],
        ),
      ),
    );
  }
}
