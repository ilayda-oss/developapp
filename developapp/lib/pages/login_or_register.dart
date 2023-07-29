import 'package:developapp/pages/registerPage.dart';
import 'package:flutter/material.dart';

import 'login.dart';

class LogInOrRegisterPage extends StatefulWidget {
  const LogInOrRegisterPage({super.key});

  @override
  State<LogInOrRegisterPage> createState() => _LogInOrRegisterPageState();
}

class _LogInOrRegisterPageState extends State<LogInOrRegisterPage> {
  // initially show login page

  bool showLoginPage = true;

  // toggle between login and register page
  void togglePages() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return LoginPage(
        onTap: togglePages,
      );
    } else {
      return RegisterPage(
        onTap: togglePages,
      );
    }
  }
}
