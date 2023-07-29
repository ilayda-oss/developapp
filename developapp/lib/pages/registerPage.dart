import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../components/myButton2.dart';
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
        Navigator.pop(context);
      } else {
        showErrorMessage('Passwords don\'t match');
      }

      // pop the loading circle
      Navigator.pop(context);
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
      backgroundColor: Color(0xFF57209D),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 40),
                child: Container(
                  // Sayfanın tamamını kaplayacak şekilde genişliği ve yüksekliği ayarlayın
                  width: 400.0, // Kutunun genişliği
                  height: 700.0, // Kutunun yüksekliği
                  decoration: BoxDecoration(
                    border: Border.symmetric(),
                    // Kenarlık kalınlığı

                    borderRadius: BorderRadius.circular(
                        20.0), // Kutunun köşelerinin yuvarlaklığı
                    image: DecorationImage(
                      image:
                          AssetImage('lib/images/ata1.png'), // Arka plan resmi
                      fit: BoxFit.cover, // Resmi kutunun içine sığdır
                    ),
                  ),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: 25), // empthy space
                        //logo
                        Icon(
                          Icons.lock,
                          color: Color(0xFF57209D),
                          size: 55,
                        ),
                        SizedBox(height: 15),

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
                          hintText: '   Email',
                          obscureText: false,
                        ),
                        const SizedBox(height: 10),

                        // password textfield
                        MyTextField(
                          controller: passwordController,
                          hintText: '   Şifre',
                          obscureText: true,
                        ),
                        const SizedBox(height: 10),
                        // confirm password textfield
                        MyTextField(
                          controller: confirmpasswordController,
                          hintText: '   Şifreyi Onayla',
                          obscureText: true,
                        ),
                        const SizedBox(height: 25),

                        //sign up button
                        MyButton2(
                          text: 'Kaydol',
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
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0),
                                child: Text(
                                  'Şununla devam et',
                                  style: TextStyle(color: Colors.grey.shade400),
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
                        const SizedBox(height: 10),

                        // google + apple sign in button
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(width: 23.0),

                            // google button
                            SquareTile(
                              onTap: () => AuthServise().signInWithGoogle(),
                              imagePath: 'lib/images/Google-Logo.png',
                            ),
                            const SizedBox(width: 10),

                            // SquareTile(
                            //   onTap: () {},
                            //   imagePath: 'lib/images/apple-logo-icon-14895.png',
                            // )

                            // apple button
                          ],
                        ),
                        const SizedBox(height: 25),

                        // not a member? register now
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Zaten hesabın var mı?',
                              style: TextStyle(
                                color: Colors.grey.shade400,
                              ),
                            ),
                            const SizedBox(height: 4),
                            GestureDetector(
                              onTap: widget.onTap,
                              child: const Text(
                                'Oturum aç.',
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
      ),
    );
  }
}
