import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wurkfux/constants/colors.dart';

class AppCard extends StatelessWidget {
  const AppCard({
    Key? key,
    required this.child,
    this.height,
    this.width,
    this.margin,
    this.padding,
    this.withShadow = false,
    this.color = AppColors.white,
    this.radius = 10.0,
  }) : super(key: key);

  const AppCard.withShadow({
    Key? key,
    required this.child,
    this.height,
    this.width,
    this.margin,
    this.padding,
    this.withShadow = true,
    this.color = AppColors.white,
    this.radius = 10.0,
  }) : super(key: key);

  final Widget child;
  final bool withShadow;
  final double? height;
  final double? width;
  final double radius;
  final Color color;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: child,
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(radius),
        boxShadow: withShadow ? [AppColors.shadow2] : null,
      ),
    );
  }
}
