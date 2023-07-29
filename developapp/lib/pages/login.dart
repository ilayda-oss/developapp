import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../components/myButton.dart';
import '../components/myTextfield.dart';
import '../components/squareTile.dart';
import '../services/auth_services.dart';

class LoginPage extends StatefulWidget {
  final Function()? onTap;
  LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // text editing controllers
  final useremailController = TextEditingController();

  final passwordController = TextEditingController();
  // colors

  // sing user in method
  void signUserIn() async {
    // show loading circle
    showDialog(
        context: context,
        builder: (context) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        });

    // try sign in
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: useremailController.text, password: passwordController.text);
      Navigator.pop(context);
      // pop the loading circle
    } on FirebaseAuthException catch (e) {
      // pop the loading circle
      Navigator.pop(context);
      // wrong email
      showErrorMessage(e.code);
    }
  }

  // wrong email message popup
  void showErrorMessage(String message) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Colors.deepPurple,
            title: Text(
              message,
              style: const TextStyle(color: Colors.white),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFDE456),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: SingleChildScrollView(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                position: DecorationPosition.background,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 50), // empthy space
                      //logo
                      Icon(
                        Icons.lock,
                        color: Color(0xFF57209D),
                        size: 100,
                      ),

                      SizedBox(height: 9),
                      const Text(
                        'Oturum aç',
                        style: TextStyle(
                            color: Color(0xFF57209D),
                            fontWeight: FontWeight.w900,
                            fontSize: 45,
                            fontFamily: 'Open Sans'),
                      ),
                      SizedBox(height: 10),
                      // welcome back, you've been
                      const Text(
                        'Welcome back you\'ve been missed!',
                        style: TextStyle(
                            color: Color(0xFF57209D),
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 15),
                      // username textfield
                      MyTextField(
                        controller: useremailController,
                        hintText: 'Username',
                        obscureText: false,
                      ),
                      const SizedBox(height: 15),

                      // password textfield
                      MyTextField(
                        controller: passwordController,
                        hintText: 'Password',
                        obscureText: true,
                      ),
                      const SizedBox(height: 10),
                      // forgot password?

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 45.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              'Forgot Password?',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 158, 157, 157)),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 15),

                      //sign in button
                      MyButton(
                        text: 'Oturum Aç',
                        onTap: signUserIn,
                      ),
                      const SizedBox(height: 15),
                      // or continue with
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: Divider(
                                thickness: .75,
                                color: Color(0xFF57209D),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: Text(
                                'Or continue with',
                                style: TextStyle(color: Color(0xFF57209D)),
                              ),
                            ),
                            Expanded(
                              child: Divider(
                                thickness: .75,
                                color: Color(0xFF57209D),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 15),

                      // google + apple sign in button
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // google button
                          SquareTile(
                            onTap: () => AuthServise().signInWithGoogle(),
                            imagePath: 'lib/images/Google-Logo.png',
                          ),
                          SizedBox(width: 10),

                          // SquareTile(
                          //   onTap: () => AuthServise().signInWithApple(),
                          //   imagePath: 'lib/images/apple-logo-icon-14895.png',
                          // )

                          // apple button
                        ],
                      ),
                      SizedBox(height: 15),

                      // not a member? register now
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Not a member?',
                            style: TextStyle(color: Colors.grey.shade700),
                          ),
                          const SizedBox(height: 4),
                          GestureDetector(
                            onTap: widget.onTap,
                            child: const Text(
                              'Register now.',
                              style: TextStyle(
                                  color: Color(0xFF57209D),
                                  fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      )
                    ]),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
