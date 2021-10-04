import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wurkfux/constants/colors.dart';
import 'package:wurkfux/constants/strings.dart';
import 'package:wurkfux/models/order_type.dart';
import 'package:wurkfux/view/widgets/shadow_card.dart';
import 'package:wurkfux/view/widgets/spacing.dart';
import 'package:wurkfux/view/wurk_fux_icons.dart';

class OrdersRow extends StatelessWidget {
  const OrdersRow({
    Key? key,
  }) : super(key: key);

  static const ordersItem = [
    OrderType(title: 'Completed', total: 15, color: AppColors.green),
    OrderType(title: 'Pending', total: 3, color: AppColors.amber),
    OrderType(title: 'Cancelled', total: 2, color: AppColors.lightRed),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: RichText(
                text: TextSpan(children: [
                  TextSpan(
                    text: "Order History\n",
                    style: TextStyle(
                      fontFamily: AppStrings.poppinsFont,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w500,
                      color: AppColors.textColorPrimary,
                      fontSize: 16.0,
                    ),
                  ),
                  TextSpan(
                    text: AppStrings.OrdersSubtitle,
                    style: TextStyle(
                      fontFamily: AppStrings.poppinsFont,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w500,
                      color: AppColors.grey,
                      fontSize: 12.0,
                    ),
                  ),
                ]),
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                WurkFuxIcons.short_right,
                size: 14.0,
                color: AppColors.black.withOpacity(0.5),
              ),
            )
          ],
        ),
        Spacing.mediumHeight(),
        SizedBox(
          height: 108,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: ordersItem.length,
            itemBuilder: (_, index) => AppCard(
              margin: const EdgeInsets.only(right: 24),
              width: 100,
              height: double.infinity,
              color: AppColors.lightGrey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    ordersItem[index].title,
                    style: TextStyle(
                      fontFamily: AppStrings.poppinsFont,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w500,
                      color: AppColors.textColorPrimary,
                      fontSize: 14.0,
                    ),
                  ),
                  Text(
                    ordersItem[index].total.toString(),
                    style: TextStyle(
                      fontFamily: AppStrings.poppinsFont,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w500,
                      color: ordersItem[index].color,
                      fontSize: 24.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
