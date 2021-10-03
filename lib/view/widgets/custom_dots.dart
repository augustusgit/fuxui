import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wurkfux/constants/colors.dart';
import 'package:wurkfux/view/utilities/size_config.dart';

class Dots extends StatelessWidget {
  // final controller;
  final int slideIndex;
  final int numberOfDots;

  Dots({required this.slideIndex, required this.numberOfDots});

  Widget _activeSlide(int index) {
    return GestureDetector(
      onTap: () {
        // print('Tapped');
        // controller.move(index);
      },
      child: new Container(
        child: Padding(
          padding: EdgeInsets.only(left: 5.0, right: 5.0),
          child: Container(
            width: getProportionateScreenWidth(10),
            height: getProportionateScreenHeight(10),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.dotBlackColor.withOpacity(0.8),
            ),
          ),
        ),
      ),
    );
  }

  Widget _inactiveSlide(int index) {
    return GestureDetector(
      onTap: () {
        // controller.move(index);
      },
      child: new Container(
        child: Padding(
          padding: EdgeInsets.only(left: 5.0, right: 5.0),
          child: Container(
            width: getProportionateScreenWidth(10),
            height: getProportionateScreenHeight(10),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.dotBlackColor.withOpacity(0.4),
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> _generateDots() {
    List<Widget> dots = [];
    for (int i = 0; i < numberOfDots; i++) {
      dots.add(i == slideIndex ? _activeSlide(i) : _inactiveSlide(i));
    }
    return dots;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: _generateDots(),
    ));
  }
}
