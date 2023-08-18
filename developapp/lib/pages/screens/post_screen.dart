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
        child: GestureDetector(
          onTap: () {},
          child: Container(
            height: 150,
            width: 150,
            color: Colors.black,
            child: TextField(
              style: TextStyle(color: Color(0xFF57209D)),
              keyboardAppearance: Brightness.dark,
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF57209D), width: 1),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF57209D), width: 2),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  fillColor: Color(0xFFFDE456),
                  filled: true,
                  hintText: "ilan ver",
                  hintStyle: TextStyle(color: Color(0xFF57209D))),
            ),
          ),
        ),
      ),
    );
  }
}
