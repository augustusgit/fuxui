import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:wurkfux/constants/colors.dart';
import 'package:wurkfux/constants/strings.dart';
import 'package:wurkfux/view/utilities/size_config.dart';

class FloatingBottomBar extends StatelessWidget {
  FloatingBottomBar({
    Key? key,
    this.selectedIndex = 0,
    this.showElevation = true,
    this.backgroundColor,
    this.itemCornerRadius = 50,
    this.containerHeight = 56,
    this.animationDuration = const Duration(milliseconds: 270),
    this.mainAxisAlignment = MainAxisAlignment.spaceBetween,
    required this.items,
    required this.onItemSelected,
    this.curve = Curves.linear,
    required this.yTransValue,
  })  : assert(items.length >= 2 && items.length <= 5),
        super(key: key);

  final int selectedIndex;
  final double yTransValue;
  final Color? backgroundColor;
  final bool showElevation;
  final Duration animationDuration;
  final List<BottomNavyBarItem> items;
  final ValueChanged<int> onItemSelected;
  final MainAxisAlignment mainAxisAlignment;
  final double itemCornerRadius;
  final double containerHeight;
  final Curve curve;

  @override
  Widget build(BuildContext context) {
    final bgColor = backgroundColor ?? Theme.of(context).bottomAppBarColor;

    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      height: containerHeight,
      margin: EdgeInsets.only(
        right: getProportionateScreenHeight(75.0),
        left: getProportionateScreenWidth(75.0),
        bottom: getProportionateScreenWidth(16.0),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(19.0),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: AppColors.lightGrey,
            blurRadius: 3.0,
            spreadRadius: 2.0,
            offset: Offset(-4.0, 4.0), // shadow direction: bottom right
          )
        ],
      ),
      transform: Matrix4.translationValues(0, yTransValue, 0),
      child: SizedBox(
        child: Container(
          height: containerHeight,
          padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 6.0),
          child: Row(
            mainAxisAlignment: mainAxisAlignment,
            children: items.map((item) {
              var index = items.indexOf(item);
              return GestureDetector(
                onTap: () => onItemSelected(index),
                child: _ItemWidget(
                  item: item,
                  isSelected: index == selectedIndex,
                  backgroundColor: bgColor,
                  itemCornerRadius: itemCornerRadius,
                  animationDuration: animationDuration,
                  curve: curve,
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}

class _ItemWidget extends StatelessWidget {
  final bool isSelected;
  final BottomNavyBarItem item;
  final Color backgroundColor;
  final double itemCornerRadius;
  final Duration animationDuration;
  final Curve curve;

  const _ItemWidget({
    Key? key,
    required this.item,
    required this.isSelected,
    required this.backgroundColor,
    required this.animationDuration,
    required this.itemCornerRadius,
    this.curve = Curves.linear,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Semantics(
      container: true,
      selected: isSelected,
      child: AnimatedContainer(
        width: isSelected ? 100 : 36,
        height: kBottomNavigationBarHeight,
        duration: animationDuration,
        curve: curve,
        decoration: BoxDecoration(
          color: isSelected
              ? item.activeColor.withOpacity(0.05)
              : item.activeColor.withOpacity(0.05),
          borderRadius: isSelected
              ? BorderRadius.circular(itemCornerRadius)
              : BorderRadius.circular(itemCornerRadius),
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          physics: NeverScrollableScrollPhysics(),
          child: Container(
            width: isSelected ? 100 : 36,
            height: kBottomNavigationBarHeight,
            padding:
                EdgeInsets.only(left: 8.0, top: 4.0, bottom: 4.0, right: 4.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                IconTheme(
                  data: IconThemeData(size: 20.0, color: AppColors.black),
                  child: item.icon,
                ),
                if (isSelected)
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.only(right: 8.0),
                      child: DefaultTextStyle.merge(
                        style: TextStyle(
                          fontFamily: AppStrings.poppinsFont,
                          color: item.activeColor,
                          fontWeight: FontWeight.normal,
                        ),
                        maxLines: 1,
                        textAlign: item.textAlign,
                        child: item.title,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class BottomNavyBarItem {
  BottomNavyBarItem({
    required this.title,
    required this.icon,
    this.activeColor = Colors.blue,
    this.textAlign,
    this.inactiveColor,
  });

  final Widget title;
  final Widget icon;
  final Color activeColor;
  final Color? inactiveColor;
  final TextAlign? textAlign;
}
