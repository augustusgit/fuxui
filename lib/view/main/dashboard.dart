import 'package:WurkFux/constants/colors.dart';
import 'package:WurkFux/constants/styles.dart';
import 'package:WurkFux/view/widgets/custom_bottom_nav_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
          icon: Icon(Icons.home),
          title: Text(
            'Blog',
            style: AppStyles.bottomBarStyle,
          ),
          activeColor: AppColors.black,
          inactiveColor: AppColors.black,
          textAlign: TextAlign.center,
        ),
        BottomNavyBarItem(
          icon: Icon(Icons.home),
          title: Text(
            'Blog',
            style: AppStyles.bottomBarStyle,
          ),
          activeColor: AppColors.black,
          inactiveColor: AppColors.black,
          textAlign: TextAlign.center,
        ),
        BottomNavyBarItem(
          icon: Icon(Icons.home),
          title: Text(
            'Blog',
            style: AppStyles.bottomBarStyle,
          ),
          activeColor: AppColors.black,
          inactiveColor: AppColors.black,
          textAlign: TextAlign.center,
        ),
        BottomNavyBarItem(
          icon: Icon(Icons.home),
          title: Text(
            'Blog',
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
      Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.red,
        child: Text('ABS1'),
      ),
      Container(
        child: Text('ABS2'),
      ),
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
