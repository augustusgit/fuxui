import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wurkfux/constants/colors.dart';
import 'package:wurkfux/constants/strings.dart';
import 'package:wurkfux/view/main/home/home_screen.dart';
import 'package:wurkfux/view/main/profile/user_profile.dart';
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
    return Scaffold(
      body: _getBody(),
      bottomNavigationBar: _buildBottomBar(),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.pushNamed(context, AppStrings.MessagesRoute);
        },
        icon: Icon(Icons.chat),
        label: Text('Talk to an Agent'),
      ),
    );
  }

  Widget _buildBottomBar() {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      onTap: _onItemTapped,
      selectedItemColor: AppColors.primaryColor,
      unselectedItemColor: Colors.grey.shade600,
      selectedLabelStyle: TextStyle(
          fontWeight: FontWeight.w600, fontFamily: AppStrings.poppinsFont),
      unselectedLabelStyle: TextStyle(
          fontWeight: FontWeight.w600, fontFamily: AppStrings.poppinsFont),
      type: BottomNavigationBarType.fixed,
      backgroundColor: AppColors.backgroundColor,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(WurkFuxIcons.bar_chart_square),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: Icon(WurkFuxIcons.user),
          label: "Profile",
        ),
      ],
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  Widget _getBody() {
    List<Widget> pages = [
      HomeScreen(),
      Profile(),
    ];
    return IndexedStack(
      index: _currentIndex,
      children: pages,
    );
  }
}
