import 'package:developapp/components/my_button2.dart';
import 'package:developapp/components/my_textfield1.dart';
import 'package:developapp/components/my_textfield2.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class ForgotPasswordPage extends StatefulWidget {
  ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  Future passwordReset() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: emailController.text.trim());
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text('Password reset link sent! Check your email.'),
            );
          });
    } on FirebaseAuthException catch (e) {
      print(e);
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text(e.message.toString()),
            );
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF57209D),
      ),
      body: Column(
        children: [
          SizedBox(height: 200),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 55),
            child: Text(
              "Emailini gir, yeni şifre için link gönderelim.",
              style: TextStyle(
                fontWeight: FontWeight.w900,
                color: Color(0xFF57209D),
                fontSize: 20,
              ),
            ),
          ),
          SizedBox(height: 50),
          Center(
            child: MyTextField1(
                controller: emailController,
                hintText: "Email",
                obscureText: false),
          ),
          SizedBox(
            height: 2,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 50.0, horizontal: 0),
            child: MyButton2(
              onTap: passwordReset,
              text: 'Reset',
            ),
          )
        ],
      ),
    );
  }
}
