import 'package:developapp/pages/login_pages/auth_page.dart';
import 'package:developapp/pages/intro_pages/onboarding_page.dart';
import 'package:flutter/material.dart';

import '../../components/my_button4.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('lib/images/start.png'),
        ),
      ),
      child: Column(
        children: [
          SizedBox(
            height: 170,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 300, horizontal: 6),
            child: MyButton4(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return OnBoardingScreen();
                  }));
                },
                text: 'START'),
          ),
        ],
      ),
    );
  }
}
