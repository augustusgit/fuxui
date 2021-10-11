import 'package:WurkFux/constants/colors.dart';
import 'package:WurkFux/constants/images.dart';
import 'package:WurkFux/constants/strings.dart';
import 'package:WurkFux/view/utilities/size_config.dart';
import 'package:WurkFux/view/widgets/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PaymentDetailTopBar extends StatelessWidget {
  const PaymentDetailTopBar(
      {Key? key, required this.title, required this.imagePath})
      : super(key: key);
  final String title, imagePath;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 32.0),
      child: Align(
        alignment: Alignment.topLeft,
        child: Row(
          children: [
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: SvgPicture.asset(
                imagePath,
                fit: BoxFit.contain,
              ),
            ),
            Spacing.mediumWidth(),
            Text(
              title,
              style: TextStyle(
                  fontSize: getProportionatefontSize(18),
                  fontWeight: FontWeight.w400,
                  color: AppColors.paymentDetailTextColor),
            )
          ],
        ),
      ),
    );
  }
}
