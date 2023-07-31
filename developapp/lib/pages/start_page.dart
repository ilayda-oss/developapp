import 'package:developapp/components/my_button2.dart';
import 'package:developapp/pages/auth_page.dart';
import 'package:flutter/material.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('lib/images/start.png'),
          fit: BoxFit.scaleDown,
          repeat: ImageRepeat.repeat, // Resmi sürekli tekrarla
        ),
      ),
      child: Column(
        children: [
          SizedBox(
            height: 170,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 300, horizontal: 1),
            child: MyButton2(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return AuthPage();
                  }));
                },
                text: 'Start'),
          ),
        ],
      ),
    );
  }
}
