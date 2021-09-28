import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wurkfux/constants/colors.dart';
import 'package:wurkfux/constants/styles.dart';
import 'package:wurkfux/view/main/chat/messages.dart';
import 'package:wurkfux/view/main/home/home_screen.dart';
import 'package:wurkfux/view/widgets/custom_bottom_nav_bar.dart';
import 'package:wurkfux/view/wurk_fux_icons.dart';

class Dashboard extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _Dashboard();
}

class _Dashboard extends State<Dashboard> {
  int _currentIndex = 0;
  double yTransValue = 0;

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollUpdateNotification>(
      child: Scaffold(
        body: _getBody(),
        extendBody: true,
        bottomNavigationBar: _buildBottomBar(),
      ),
      onNotification: (notification) {
        if (notification.scrollDelta?.sign == 1) {
          setState(() {
            yTransValue = 100;
          });
        } else if (notification.scrollDelta?.sign == -1) {
          setState(() {
            yTransValue = 0;
          });
        }
        return true;
      },
    );
  }

  Widget _buildBottomBar() {
    return FloatingBottomBar(
      containerHeight: 60.0,
      yTransValue: yTransValue,
      backgroundColor: Colors.transparent,
      selectedIndex: _currentIndex,
      showElevation: true,
      itemCornerRadius: 20.0,
      curve: Curves.easeIn,
      onItemSelected: (index) => setState(() => _currentIndex = index),
      items: <BottomNavyBarItem>[
        BottomNavyBarItem(
          icon: Icon(WurkFuxIcons.bar_chart_square),
          title: Text(
            'Home',
            style: AppStyles.bottomBarStyle,
          ),
          activeColor: AppColors.black,
          inactiveColor: AppColors.black,
          textAlign: TextAlign.center,
        ),
        BottomNavyBarItem(
          icon: Icon(WurkFuxIcons.mail),
          title: Text(
            'InMail',
            style: AppStyles.bottomBarStyle,
          ),
          activeColor: AppColors.black,
          inactiveColor: AppColors.black,
          textAlign: TextAlign.center,
        ),
        BottomNavyBarItem(
          icon: Icon(WurkFuxIcons.orders),
          title: Text(
            'Services',
            style: AppStyles.bottomBarStyle,
          ),
          activeColor: AppColors.black,
          inactiveColor: AppColors.black,
          textAlign: TextAlign.center,
        ),
        BottomNavyBarItem(
          icon: Icon(WurkFuxIcons.user),
          title: Text(
            'Profile',
            style: AppStyles.bottomBarStyle,
          ),
          activeColor: AppColors.black,
          inactiveColor: AppColors.black,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _getBody() {
    List<Widget> pages = [
      HomeScreen(),
      MessagesScreen(),
      Container(
        child: Text('ABS3'),
      ),
      Container(
        child: Text('ABS4'),
      ),
    ];
    return IndexedStack(
      index: _currentIndex,
      children: pages,
    );
  }
}
