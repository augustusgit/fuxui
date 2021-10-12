import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wurkfux/constants/colors.dart';
import 'package:wurkfux/constants/strings.dart';
import 'package:wurkfux/models/order_history.dart';
import 'package:wurkfux/models/order_status.dart';
import 'package:wurkfux/view/widgets/spacing.dart';

class Histories extends StatelessWidget {
  const Histories({required this.orderStatus, required this.histories});

  final OrderStatus orderStatus;
  final List<OrderHistory> histories;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
        physics: BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Spacing.largeHeight(),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemCount: histories.length,
              itemBuilder: (_, index) => InkWell(
                splashColor: AppColors.darkPrimaryColor,
                highlightColor: AppColors.primaryColor,
                onTap: () {
                  // Navigator.pushNamed(context, AppStrings.OneOffDetailsRoute);
                },
                child: Container(
                  height: 125.0,
                  margin: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      10.0,
                    ),
                    color: AppColors.white,
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 125.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(15.0),
                          ),
                          image: DecorationImage(
                              image: NetworkImage(histories[index].imageUrl),
                              fit: BoxFit.cover),
                        ),
                      ),
                      Spacing.mediumWidth(),
                      Expanded(
                        child: Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                histories[index].orderTitle,
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FontStyle.normal,
                                    fontFamily: AppStrings.poppinsFont,
                                    fontSize: 16.0),
                              ),
                              Spacing.smallHeight(),
                              Text(
                                histories[index].orderSub,
                                style: TextStyle(
                                    color: AppColors.neutralGrey,
                                    fontWeight: FontWeight.w400,
                                    fontStyle: FontStyle.normal,
                                    fontFamily: AppStrings.poppinsFont,
                                    fontSize: 14.0),
                              ),
                              Spacing.smallHeight(),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '\$${histories[index].price}',
                                    style: TextStyle(
                                      color: AppColors.primaryColor,
                                      fontWeight: FontWeight.w700,
                                      fontStyle: FontStyle.normal,
                                      fontFamily: AppStrings.poppinsFont,
                                      fontSize: 18.0,
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.only(
                                        left: 16.0,
                                        right: 16.0,
                                        top: 5.0,
                                        bottom: 5.0),
                                    decoration: BoxDecoration(
                                        color: AppColors.blue.withOpacity(0.1),
                                        borderRadius:
                                            BorderRadius.circular(20.0)),
                                    child: Text(
                                      orderStatus.name,
                                      style: TextStyle(
                                          color: AppColors.black,
                                          fontWeight: FontWeight.w300,
                                          fontStyle: FontStyle.normal,
                                          fontFamily: AppStrings.poppinsFont,
                                          fontSize: 12.0),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
