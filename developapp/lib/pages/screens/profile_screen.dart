import 'package:developapp/components/nav_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final text = MediaQuery.of(context).platformBrightness == Brightness.dark
        ? 'DrakTheme'
        : 'LightTheme';
    return Container(
        child: Scaffold(
      drawer: NavBar(),
      backgroundColor: Color(0xFFFDE456),
      appBar: AppBar(),
    ));
  }
}
//  Color(0xFF57209D), mor, Color(0xFFFDE456), sarı
// her gün yeni bi şey öğreniyok stl yazınca direkt çıkomus statless widget way 
