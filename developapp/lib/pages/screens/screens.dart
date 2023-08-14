import 'package:developapp/pages/screens/home_screen.dart';
import 'package:developapp/pages/screens/notification_screen.dart';
import 'package:developapp/pages/screens/post_screen.dart';
import 'package:developapp/pages/screens/profile_screen.dart';
import 'package:developapp/pages/screens/search_screen.dart';
import 'package:flutter/material.dart';

import '../../components/widgets/change_theme_button.dart';

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
    return Scaffold(
      body: _pageOptions[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Color.fromARGB(255, 228, 103, 176),
            icon: ClipRRect(
              borderRadius: BorderRadius.circular(22),
              child: Container(
                  height: 50,
                  color: Color(0xFFFDE456),
                  padding: EdgeInsets.all(5),
                  child: Image.asset('lib/images/house.png')),
            ),
            label: 'Ana Sayfa',
          ),
          BottomNavigationBarItem(
            backgroundColor: Color.fromARGB(255, 228, 103, 176),
            icon: ClipRRect(
              borderRadius: BorderRadius.circular(22),
              child: Container(
                  height: 50,
                  color: Color(0xFFFDE456),
                  padding: EdgeInsets.all(5),
                  child: Image.asset('lib/images/search.png')),
            ),
            label: 'Ara',
          ),
          BottomNavigationBarItem(
            backgroundColor: Color.fromARGB(255, 228, 103, 176),
            icon: ClipRRect(
              borderRadius: BorderRadius.circular(22),
              child: Container(
                  height: 50,
                  color: Color(0xFFFDE456),
                  padding: EdgeInsets.all(5),
                  child: Image.asset('lib/images/add.png')),
            ),
            label: 'Ekle',
          ),
          BottomNavigationBarItem(
            backgroundColor: Color.fromARGB(255, 228, 103, 176),
            icon: ClipRRect(
              borderRadius: BorderRadius.circular(22),
              child: Container(
                  height: 50,
                  color: Color(0xFFFDE456),
                  padding: EdgeInsets.all(5),
                  child: Image.asset('lib/images/notification.png')),
            ),
            label: 'Bildirim',
          ),
          BottomNavigationBarItem(
            backgroundColor: Color.fromARGB(255, 228, 103, 176),
            icon: ClipRRect(
              borderRadius: BorderRadius.circular(22),
              child: Container(
                  height: 50,
                  color: Color(0xFFFDE456), // Color(0xFFFDE456),
                  padding: EdgeInsets.all(5),
                  child: Image.asset('lib/images/profile.png')),
            ),
            label: 'Profil',
          ),
        ],
        fixedColor: Color(0xFF57209D),
        selectedLabelStyle: TextStyle(
            fontWeight: FontWeight.w700, fontSize: 11), // Color(0xFF57209D),
      ),
    );
  }
}
