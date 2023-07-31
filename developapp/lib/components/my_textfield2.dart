import 'package:flutter/material.dart';

class MyTextField2 extends StatelessWidget {
  final controller;
  final String hintText;
  final bool obscureText;

  const MyTextField2({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 47.0),
      child: TextField(
        style: TextStyle(color: Color(0xFF57209D)),
        keyboardAppearance: Brightness.dark,
        controller: controller,
        obscureText: obscureText,
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
            hintText: hintText,
            hintStyle: TextStyle(color: Color(0xFF57209D))),
      ),
    );
  }
}
