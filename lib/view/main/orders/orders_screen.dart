import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wurkfux/constants/colors.dart';
import 'package:wurkfux/constants/strings.dart';
import 'package:wurkfux/models/order_history.dart';
import 'package:wurkfux/models/order_status.dart';

import 'orders.dart';

class OrdersScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _Orders();
}

class _Orders extends State<OrdersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: const Text(
          AppStrings.OrdersTitle,
          style: TextStyle(
              color: AppColors.black,
              fontWeight: FontWeight.w700,
              fontFamily: AppStrings.poppinsFont,
              fontSize: 24.0),
        ),
        elevation: 0.0,
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.white,
      ),
      body: DefaultTabController(
        length: 3,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.lightGrey,
                  borderRadius: BorderRadius.all(
                    Radius.circular(15.0),
                  ),
                ),
                child: TabBar(
                  indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      // Creates border
                      color: AppColors.primaryColor),
                  indicatorColor: AppColors.primaryColor,
                  unselectedLabelColor: AppColors.black,
                  labelStyle: TextStyle(
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w500,
                    fontSize: 16.0,
                  ),
                  tabs: [
                    Tab(
                      text: 'In Progress (${activeHistories.length})',
                    ),
                    Tab(
                      text: 'Completed (${completedHistories.length})',
                    ),
                    Tab(
                      text: 'Cancelled (${cancelledHistories.length})',
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  Histories(
                    histories: activeHistories,
                    orderStatus: OrderStatus.ONGOING,
                  ),
                  Histories(
                    histories: completedHistories,
                    orderStatus: OrderStatus.COMPLETED,
                  ),
                  Histories(
                    histories: cancelledHistories,
                    orderStatus: OrderStatus.CANCELLED,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
