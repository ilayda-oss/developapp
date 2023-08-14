import 'package:flutter/material.dart';

import '../../components/widgets/change_theme_button.dart';

class NotificationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final text = MediaQuery.of(context).platformBrightness == Brightness.dark
        ? 'DrakTheme'
        : 'LightTheme';
    return Scaffold(
      backgroundColor: Color(0xFFFDE456),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 228, 103, 176),
        automaticallyImplyLeading: false,
        leading: Image.asset('lib/images/logosarı.png'),
        title: Text(
          "e v e l o p",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w900,
            color: Color(0xFFFDE456),
          ),
        ),
      ),
    );
  }
}
