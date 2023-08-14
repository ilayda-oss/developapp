import 'package:flutter/material.dart';

class PostScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final text = MediaQuery.of(context).platformBrightness == Brightness.dark
        ? 'DrakTheme'
        : 'LightTheme';
    return Scaffold(
      backgroundColor:
          Color(0xFFFDE456), // Replace this with your actual home page content

      body: Center(
        child: Container(
            height: 150,
            width: 150,
            color: Colors.white,
            child: Center(child: Text('İlan ver'))),
      ),
    );
  }
}
