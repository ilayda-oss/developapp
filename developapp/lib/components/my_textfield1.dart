import 'package:flutter/material.dart';

class MyTextField1 extends StatelessWidget {
  final controller;
  final String hintText;
  final bool obscureText;

  const MyTextField1({
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
        style: TextStyle(color: Color(0xFFFDE456)),
        keyboardAppearance: Brightness.light,
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFFFDE456), width: 1),
              borderRadius: BorderRadius.circular(30),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFFFDE456), width: 2),
              borderRadius: BorderRadius.circular(30),
            ),
            fillColor: Color(0xFF57209D),
            filled: true,
            hintText: hintText,
            hintStyle: TextStyle(color: Color(0xFFFDE456))),
      ),
    );
  }
}
