import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wurkfux/constants/colors.dart';
import 'package:wurkfux/constants/strings.dart';
import 'package:wurkfux/models/order_type.dart';
import 'package:wurkfux/view/widgets/shadow_card.dart';
import 'package:wurkfux/view/widgets/spacing.dart';

class OrdersRow extends StatelessWidget {
  const OrdersRow({
    Key? key,
  }) : super(key: key);

  static const ordersItem = [
    OrderType(title: 'Completed Order', total: 12, color: AppColors.green),
    OrderType(title: 'Ongoing Order', total: 10, color: AppColors.amber),
    OrderType(title: 'Cancelled Order', total: 2, color: AppColors.lightRed),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
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
        Spacing.mediumHeight(),
        SizedBox(
          height: 100,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: ordersItem.length,
            itemBuilder: (_, index) => AppCard(
              margin: const EdgeInsets.only(right: 24),
              width: 100,
              height: double.infinity,
              color: _orderColor(index),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                    child: Text(
                      ordersItem[index].title,
                      softWrap: true,
                      style: TextStyle(
                        fontFamily: AppStrings.poppinsFont,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w500,
                        color: AppColors.textColorPrimary,
                        fontSize: 14.0,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                    child: Text(
                      ordersItem[index].total.toString(),
                      style: TextStyle(
                        fontFamily: AppStrings.poppinsFont,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w500,
                        color: AppColors.black,
                        fontSize: 20.0,
                      ),
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

  Color _orderColor(int index) {
    if (index == 0) {
      return AppColors.green.withOpacity(0.1);
    } else if (index == 1) {
      return AppColors.lightGrey;
    } else {
      return AppColors.lightRed.withOpacity(0.1);
    }
  }
}
