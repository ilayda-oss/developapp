import 'package:flutter/material.dart';

class IntroPage4 extends StatelessWidget {
  const IntroPage4({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFDE456),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 40),
          child: Container(
            //  color: Color(0xFFFDE456), // Color(0xFF57209D)
            height: 700,
            decoration: BoxDecoration(
              border: Border.symmetric(),
              image: DecorationImage(
                image: AssetImage("lib/images/4.png"),
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
      ),
    );
    // return Container(
    //   height: 200,
    //   decoration: BoxDecoration(
    //     image: DecorationImage(
    //       image: AssetImage("lib/images/4.png"),
    //       fit: BoxFit.contain,
    //     ),
    //   ),
    // );
  }
}
