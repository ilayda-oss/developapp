import 'package:developapp/components/my_button3.dart';
import 'package:developapp/components/my_textfield1.dart';
import 'package:developapp/components/my_textfield2.dart';
import 'package:developapp/pages/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'auth_page.dart';

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
              backgroundColor: Color(0xFF57209D),
              contentTextStyle: TextStyle(color: Colors.white),
              content: Text(e.message.toString()),
            );
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('lib/images/soru.png'),
              fit: BoxFit.scaleDown,
              repeat: ImageRepeat.repeat // Resmi sürekli tekrarla
              ),
        ),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Container(
                  // Sayfanın tamamını kaplayacak şekilde genişliği ve yüksekliği ayarlayın
                  width: 350.0, // Kutunun genişliği
                  height: 550.0, // Kutunun yüksekliği
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
                        //logo
                        // Icon(
                        //   Icons.lock,
                        //   color: Color(0xFF57209D),
                        //   size: 50,
                        // ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Container(
                            padding: EdgeInsets.all(10),
                            height: 50,
                            color: Colors.deepPurple,
                            child: Image.asset('lib/images/logo.png'),
                          ),
                        ),
                        // empthy space
                        // welcome back, you've been
                        Center(
                            child: Text(
                          "Şifreni sıfırla",
                          style: TextStyle(
                              fontWeight: FontWeight.w900,
                              color: Color(0xFF57209D),
                              fontSize: 26,
                              fontFamily: 'Open Sans'),
                        )),
                        SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 70, vertical: 10),
                          child: Center(
                            child: const Text(
                              'E-posta adresini gir ve hesabına yeniden girebilmen için sana bir bağlantı gönderelim',
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                color: Color(0xFF57209D),
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),

                        // username textfield
                        MyTextField2(
                          controller: emailController,
                          hintText: '   Email',
                          obscureText: false,
                        ),
                        SizedBox(height: 10),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return AuthPage();
                            }));
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 50),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                const Text(
                                  'Oturum aç',
                                  style: TextStyle(
                                      color: Color(0xFF57209D),
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        //reset button
                        MyButton3(
                          text: 'Sıfırla',
                          onTap: passwordReset,
                        ),
                      ]),

                  // or continue with
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
