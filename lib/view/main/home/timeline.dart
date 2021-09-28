import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wurkfux/constants/colors.dart';
import 'package:wurkfux/constants/strings.dart';
import 'package:wurkfux/models/order_history.dart';
import 'package:wurkfux/models/order_status.dart';
import 'package:wurkfux/view/widgets/spacing.dart';

class Timeline extends StatelessWidget {
  const Timeline({
    Key? key,
  }) : super(key: key);

  static const histories = [
    OrderHistory(
        id: 1,
        orderTitle: 'orderTitle',
        orderSub: 'orderSub',
        orderStatus: OrderStatus.PENDING,
        price: '300'),
    OrderHistory(
        id: 2,
        orderTitle: 'orderTitle',
        orderSub: 'orderSub',
        orderStatus: OrderStatus.COMPLETED,
        price: '300'),
    OrderHistory(
        id: 3,
        orderTitle: 'orderTitle',
        orderSub: 'orderSub',
        orderStatus: OrderStatus.COMPLETED,
        price: '300'),
    OrderHistory(
        id: 4,
        orderTitle: 'orderTitle',
        orderSub: 'orderSub',
        orderStatus: OrderStatus.COMPLETED,
        price: '300'),
    OrderHistory(
        id: 5,
        orderTitle: 'orderTitle',
        orderSub: 'orderSub',
        orderStatus: OrderStatus.REJECTED,
        price: '300'),
    OrderHistory(
        id: 6,
        orderTitle: 'orderTitle',
        orderSub: 'orderSub',
        orderStatus: OrderStatus.PENDING,
        price: '300'),
    OrderHistory(
        id: 7,
        orderTitle: 'orderTitle',
        orderSub: 'orderSub',
        orderStatus: OrderStatus.PENDING,
        price: '300'),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              child: RichText(
                text: TextSpan(children: [
                  TextSpan(
                    text: "${AppStrings.TimelineHead}\n",
                    style: TextStyle(
                      fontFamily: AppStrings.poppinsFont,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w500,
                      color: AppColors.textColorPrimary,
                      fontSize: 16.0,
                    ),
                  ),
                  TextSpan(
                    text: AppStrings.TimelineChild,
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
            Spacer(),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.arrow_forward,
                size: 16.0,
              ),
              constraints: BoxConstraints(),
              padding: EdgeInsets.zero,
            )
          ],
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          scrollDirection: Axis.vertical,
          itemCount: histories.length,
          itemBuilder: (_, index) => Container(
              margin: const EdgeInsets.only(top: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        histories[index].orderTitle,
                        style: TextStyle(
                          fontFamily: AppStrings.poppinsFont,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w500,
                          color: AppColors.textColorPrimary,
                          fontSize: 14.0,
                        ),
                      ),
                      Text(
                        histories[index].orderSub,
                        style: TextStyle(
                          fontFamily: AppStrings.poppinsFont,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w500,
                          color: AppColors.textColorPrimary,
                          fontSize: 12.0,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        histories[index].orderStatus.name.toUpperCase(),
                        style: TextStyle(
                          color: _calculateColor(histories[index].orderStatus),
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w500,
                          fontFamily: AppStrings.poppinsFont,
                          fontSize: 12.0,
                        ),
                      ),
                      Spacing.bigWidth(),
                      RichText(
                        text: TextSpan(children: [
                          TextSpan(
                            text: "\$",
                            style: TextStyle(
                              color: AppColors.textColorPrimary,
                              fontFamily: AppStrings.poppinsFont,
                              fontWeight: FontWeight.w700,
                              fontStyle: FontStyle.normal,
                              fontSize: 12.0,
                            ),
                          ),
                          TextSpan(
                            text: histories[index].price,
                            style: TextStyle(
                              color: AppColors.textColorPrimary,
                              fontFamily: AppStrings.poppinsFont,
                              fontWeight: FontWeight.w700,
                              fontStyle: FontStyle.normal,
                              fontSize: 14.0,
                            ),
                          ),
                        ]),
                      ),
                    ],
                  )
                ],
              )),
        ),
      ],
    );
  }

  Color _calculateColor(OrderStatus status) {
    if (status == OrderStatus.COMPLETED) {
      return AppColors.green;
    } else if (status == OrderStatus.PENDING) {
      return AppColors.amber;
    } else {
      return AppColors.lightRed;
    }
  }
}
