import 'package:flutter/material.dart';

class MyButton2 extends StatelessWidget {
  final Function()? onTap;
  final String text;

  const MyButton2({super.key, required this.onTap, required this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(25),
        margin: const EdgeInsets.symmetric(horizontal: 50),
        decoration: BoxDecoration(
          color: Color(0xFF57209D),
          borderRadius: BorderRadius.circular(35), // sharpe corners gone
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
                color: Color(0xFFFDE456),
                fontWeight: FontWeight.bold,
                fontSize: 24),
          ),
        ),
      ),
    );
  }
}
