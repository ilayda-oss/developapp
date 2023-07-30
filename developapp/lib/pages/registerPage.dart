import 'package:developapp/components/myTextfield2.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../components/myButton2.dart';
import '../components/myTextfield1.dart';
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
            backgroundColor: Color(0xFF57209D),
            title: Text(
              message,
              style: const TextStyle(color: Colors.white),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('lib/images/işaret.png'),
          fit: BoxFit.scaleDown,
          repeat: ImageRepeat.repeat, // Resmi sürekli tekrarla
        ),
      ),
      child: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 40),
                child: Container(
                  // Sayfanın tamamını kaplayacak şekilde genişliği ve yüksekliği ayarlayın
                  width: 400.0, // Kutunun genişliği
                  height: 600.0, // Kutunun yüksekliği
                  decoration: BoxDecoration(
                    border: Border.symmetric(),
                    // Kenarlık kalınlığı

                    borderRadius: BorderRadius.circular(
                        20.0), // Kutunun köşelerinin yuvarlaklığı
                    image: DecorationImage(
                      image: AssetImage(
                          'lib/images/sarıback.png'), // Arka plan resmi
                      fit: BoxFit.fill, // Resmi kutunun içine sığdır
                    ),
                  ),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: 25), // empthy space
                        //logo
                        // Icon(
                        //   Icons.lock,
                        //   color: Color(0xFF57209D),
                        //   size: 25,
                        // ),
                        SizedBox(height: 10),

                        // welcome back, you've been
                        const Text(
                          'Yeni Hesap \n    Oluştur',
                          style: TextStyle(
                              fontWeight: FontWeight.w900,
                              color: Color(0xFF57209D),
                              fontSize: 36,
                              fontFamily: 'Open Sans'),
                        ),

                        const SizedBox(height: 15),
                        // username textfield
                        MyTextField2(
                          controller: useremailController,
                          hintText: '   Email',
                          obscureText: false,
                        ),
                        const SizedBox(height: 10),

                        // password textfield
                        MyTextField2(
                          controller: passwordController,
                          hintText: '   Şifre',
                          obscureText: true,
                        ),
                        const SizedBox(height: 10),
                        // confirm password textfield
                        MyTextField2(
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
                        const SizedBox(height: 9),
                        // or continue with
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25.0),
                          child: Row(
                            children: [
                              Expanded(
                                child: Divider(
                                  thickness: 0.5,
                                  color: Color(0xFF57209D),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0),
                                child: Text(
                                  'Şununla devam et',
                                  style: TextStyle(color: Color(0xFF57209D)),
                                ),
                              ),
                              Expanded(
                                child: Divider(
                                  thickness: 0.5,
                                  color: Color(0xFF57209D),
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
                        const SizedBox(height: 15),

                        // not a member? register now
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Zaten hesabın var mı?',
                              style: TextStyle(
                                color: Color(0xFF57209D),
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
