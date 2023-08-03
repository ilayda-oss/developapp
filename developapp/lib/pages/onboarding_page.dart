import 'package:developapp/components/my_button4.dart';
import 'package:developapp/pages/auth_page.dart';
import 'package:developapp/pages/login.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../components/my_button5.dart';
import 'intro_page1.dart';
import 'intro_page2.dart';
import 'intro_page3.dart';
import 'intro_page4.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  // controller keep track of which page we are on
  PageController _controller = PageController();
  // keep a track of we are in last page or not
  bool onLastPage = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            onPageChanged: (index) {
              setState(() {
                onLastPage = (index == 3);
              });
            },
            children: [
              IntroPage1(),
              IntroPage2(),
              IntroPage3(),
              IntroPage4(),
            ],
          ),

          //dot indicators
          Container(
              alignment: Alignment(0, 0.75),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    //skip
                    GestureDetector(
                        onTap: () {
                          _controller.previousPage(
                            duration: Duration(milliseconds: 500),
                            curve: Curves.easeIn,
                          );
                        },
                        child: Text('')),
                    // dot indicator
                    SmoothPageIndicator(controller: _controller, count: 4),
                    // next or done
                    onLastPage
                        ? GestureDetector(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return AuthPage();
                              }));
                            },
                            child: Text(''))
                        : GestureDetector(
                            onTap: () {
                              _controller.nextPage(
                                duration: Duration(milliseconds: 500),
                                curve: Curves.easeIn,
                              );
                            },
                            child: Text(''))
                  ])),
        ],
      ),
    );
  }
}
