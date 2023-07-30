import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../components/myButton1.dart';
import '../components/myTextfield1.dart';
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
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('lib/images/kutu.png'),
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
                          'lib/images/morback.png'), // Arka plan resmi
                      fit: BoxFit.fill, // Resmi kutunun içine sığdır
                    ),
                  ),

                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // empthy space
                        // //logo
                        // Icon(
                        //   Icons.lock,
                        //   color: Color(0xFFFDE456),
                        //   size: 50,
                        // ),

                        const Text(
                          'Oturum aç',
                          style: TextStyle(
                              color: Color(0xFFFDE456),
                              fontWeight: FontWeight.w900,
                              fontSize: 45,
                              fontFamily: 'Open Sans'),
                        ),
                        SizedBox(height: 9),
                        // welcome back, you've been
                        const Text(
                          'Devam etmek için oturum aç.',
                          style: TextStyle(
                              color: Color(0xFFFDE456),
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 55),
                        // username textfield
                        MyTextField1(
                          controller: useremailController,
                          hintText: '   Email',
                          obscureText: false,
                        ),

                        const SizedBox(height: 15),

                        // password textfield
                        MyTextField1(
                          controller: passwordController,
                          hintText: '   Şifre',
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
                                'Şifremi Unuttum',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 158, 157, 157)),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 15),

                        //sign in button
                        MyButton1(
                          text: 'Giriş Yap',
                          onTap: signUserIn,
                        ),
                        const SizedBox(height: 25),
                        // or continue with
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25.0),
                          child: Row(
                            children: [
                              Expanded(
                                child: Divider(
                                  thickness: .75,
                                  color: Color(0xFFFDE456),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0),
                                child: Text(
                                  'Şununla devam et',
                                  style: TextStyle(color: Color(0xFFFDE456)),
                                ),
                              ),
                              Expanded(
                                child: Divider(
                                  thickness: .75,
                                  color: Color(0xFFFDE456),
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
                            SizedBox(width: 13.0),
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
                        SizedBox(height: 7),

                        // not a member? register now
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Hesabın yok mu? ',
                              style: TextStyle(color: Color(0xFFFDE456)),
                            ),
                            const SizedBox(height: 4),
                            GestureDetector(
                              onTap: widget.onTap,
                              child: const Text(
                                'Kaydol.',
                                style: TextStyle(
                                    color: Color(0xFFFDE456),
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
