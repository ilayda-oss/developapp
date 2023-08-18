import 'package:developapp/pages/screens/home_screen.dart';
import 'package:developapp/pages/screens/notification_screen.dart';
import 'package:developapp/pages/screens/post_screen.dart';
import 'package:developapp/pages/screens/profile_screen.dart';
import 'package:developapp/pages/screens/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/theme_provider.dart';

class Screen extends StatefulWidget {
  @override
  _ScreenState createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  int _selectedIndex = 0;
  List<Widget> _pageOptions = <Widget>[
    HomeScreen(),
    SearchScreen(),
    PostScreen(),
    NotificationScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      body: _pageOptions[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            backgroundColor: themeProvider.appBarColor,
            icon: ClipRRect(
              borderRadius: BorderRadius.circular(22),
              child: Container(
                  height: 50,
                  color: themeProvider.buttonColor,
                  padding: EdgeInsets.all(5),
                  child: Image.asset(
                    'lib/images/house.png',
                    color: themeProvider.assetColor,
                  )),
            ),
            label: 'Ana Sayfa',
          ),
          BottomNavigationBarItem(
            backgroundColor: themeProvider.appBarColor,
            icon: ClipRRect(
              borderRadius: BorderRadius.circular(22),
              child: Container(
                  height: 50,
                  color: themeProvider.buttonColor,
                  padding: EdgeInsets.all(5),
                  child: Image.asset(
                    'lib/images/search.png',
                    color: themeProvider.assetColor,
                  )),
            ),
            label: 'Ara',
          ),
          BottomNavigationBarItem(
            backgroundColor: themeProvider.appBarColor,
            icon: ClipRRect(
              borderRadius: BorderRadius.circular(22),
              child: Container(
                  height: 50,
                  color: themeProvider.buttonColor,
                  padding: EdgeInsets.all(5),
                  child: Image.asset(
                    'lib/images/add.png',
                    color: themeProvider.assetColor,
                  )),
            ),
            label: 'Ekle',
          ),
          BottomNavigationBarItem(
            backgroundColor: themeProvider.appBarColor,
            icon: ClipRRect(
              borderRadius: BorderRadius.circular(22),
              child: Container(
                  height: 50,
                  color: themeProvider.buttonColor,
                  padding: EdgeInsets.all(5),
                  child: Image.asset(
                    'lib/images/notification.png',
                    color: themeProvider.assetColor,
                  )),
            ),
            label: 'Bildirim',
          ),
          BottomNavigationBarItem(
            backgroundColor: themeProvider.appBarColor,
            icon: ClipRRect(
              borderRadius: BorderRadius.circular(22),
              child: Container(
                  height: 50,
                  color: themeProvider.buttonColor, // Color(0xFFFDE456),
                  padding: EdgeInsets.all(5),
                  child: Image.asset(
                    'lib/images/profile.png',
                    color: themeProvider.assetColor,
                  )),
            ),
            label: 'Profil',
          ),
        ],
        fixedColor: themeProvider.assetColor,
        selectedLabelStyle: TextStyle(
            fontWeight: FontWeight.w700, fontSize: 11), // Color(0xFF57209D),
      ),
    );
  }
}
