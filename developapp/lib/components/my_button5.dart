import 'package:flutter/material.dart';

class MyButton5 extends StatelessWidget {
  final Function()? onTap;
  final String text;

  const MyButton5({super.key, required this.onTap, required this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        margin: const EdgeInsets.symmetric(horizontal: 75),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 228, 103, 176),
          borderRadius: BorderRadius.circular(55), // sharpe corners gone
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 28),
          ),
        ),
      ),
    );
  }
}
