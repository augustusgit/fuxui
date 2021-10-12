import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wurkfux/constants/colors.dart';
import 'package:wurkfux/constants/strings.dart';

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
                      text: 'In Progress (4)',
                    ),
                    Tab(
                      text: 'Completed (10)',
                    ),
                    Tab(
                      text: 'Cancelled (8)',
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  Icon(Icons.directions_car),
                  Icon(Icons.directions_transit),
                  Icon(Icons.directions_bike),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
