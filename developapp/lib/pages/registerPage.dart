import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../components/myButton.dart';
import '../components/myTextfield.dart';
import '../components/squareTile.dart';
import '../services/auth_services.dart';

class RegisterPage extends StatefulWidget {
  final Function()? onTap;
  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // text editing controllers
  final useremailController = TextEditingController();

  final passwordController = TextEditingController();

  final confirmpasswordController = TextEditingController();

  // sing user up method
  void signUserUp() async {
    // show loading circle
    showDialog(
        context: context,
        builder: (context) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        });

    // try creating the user
    try {
      // check if password is comfirmed
      // ignore: unrelated_type_equality_checks
      if (passwordController.text == confirmpasswordController.text) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: useremailController.text, password: passwordController.text);
      } else {
        showErrorMessage('Passwords don\'t match');
      }
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
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 25), // empthy space
                    //logo
                    Icon(
                      Icons.lock,
                      size: 50,
                    ),
                    SizedBox(height: 25),

                    // welcome back, you've been
                    const Text(
                      'Let\'s create an account for you!',
                      style: TextStyle(
                        color: Color.fromARGB(255, 142, 141, 141),
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 25),
                    // username textfield
                    MyTextField(
                      controller: useremailController,
                      hintText: 'Username',
                      obscureText: false,
                    ),
                    const SizedBox(height: 10),

                    // password textfield
                    MyTextField(
                      controller: passwordController,
                      hintText: 'Password',
                      obscureText: true,
                    ),
                    const SizedBox(height: 10),
                    // confirm password textfield
                    MyTextField(
                      controller: confirmpasswordController,
                      hintText: 'Confirm Password',
                      obscureText: true,
                    ),
                    const SizedBox(height: 50),

                    //sign up button
                    MyButton(
                      text: 'Sign Up',
                      onTap: signUserUp,
                    ),
                    const SizedBox(height: 50),
                    // or continue with
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Divider(
                              thickness: 0.5,
                              color: Colors.grey.shade400,
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Text(
                              'Or continue with',
                              style: TextStyle(color: Colors.grey.shade700),
                            ),
                          ),
                          Expanded(
                            child: Divider(
                              thickness: 0.5,
                              color: Colors.grey.shade400,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 50),

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
                        //   onTap: () {},
                        //   imagePath: 'lib/images/apple-logo-icon-14895.png',
                        // )

                        // apple button
                      ],
                    ),
                    SizedBox(height: 25),

                    // not a member? register now
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Already have an account?',
                          style: TextStyle(color: Colors.grey.shade700),
                        ),
                        const SizedBox(height: 4),
                        GestureDetector(
                          onTap: widget.onTap,
                          child: const Text(
                            'Login now.',
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
    );
  }
}
