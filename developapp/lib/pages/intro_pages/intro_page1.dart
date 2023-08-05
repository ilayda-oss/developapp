import 'package:flutter/material.dart';

class IntroPage1 extends StatelessWidget {
  const IntroPage1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFDE456),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Container(
            //  color: Color(0xFFFDE456), // Color(0xFF57209D)
            height: 760,
            decoration: BoxDecoration(
              border: Border.symmetric(),
              image: DecorationImage(
                image: AssetImage("lib/images/1.png"),
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
