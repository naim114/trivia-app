import 'package:animated_button/animated_button.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:page_transition/page_transition.dart';
import 'package:trivia_app/pages/login.dart';
import 'package:trivia_app/theme/theme.dart';

import 'home.dart';

class Onboarding extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      // backgroundColor: AppTheme.bgColorScreen,
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/img/wallpaper_gradient.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Center(
                      child: TextLiquidFill(
                        text: 'Triviazilla',
                        waveColor: AppTheme.white,
                        boxBackgroundColor: AppTheme.bgColorScreen,
                        textStyle: TextStyle(
                          fontSize: size.height * 0.05,
                          fontWeight: FontWeight.bold,
                          fontFamily: "RobotoSlab",
                        ),
                        boxHeight: size.height * 0.1,
                        boxWidth: size.width * 0.8,
                      ),
                    ),
                  ),
                  Text(
                    "Create and answer quizzes with just a few tap.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppTheme.text,
                      fontFamily: "Oxygen",
                      fontWeight: FontWeight.bold,
                      fontSize: size.height * 0.02,
                    ),
                  ),
                  SizedBox(height: 40),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: AnimatedButton(
                      color: AppTheme.bgColorScreen,
                      width: size.width * 0.8,
                      child: Text(
                        'Log In or Sign Up',
                        style: TextStyle(
                          fontSize: 22,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      onPressed: () {
                        // Navigator.push(
                        //   context,
                        //   // PageTransition(
                        //   //   type: PageTransitionType.leftToRight,
                        //   //   child: Login(),
                        //   //   // builder: (BuildContext context) => Login(),
                        //   // ),
                        //   CupertinoPageRoute(
                        //     builder: (BuildContext context) => Login(),
                        //   ),
                        // );
                        Fluttertoast.showToast(
                            msg:
                                "Creating an account is unavailable right now");
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: AnimatedButton(
                      color: AppTheme.white,
                      width: size.width * 0.8,
                      child: Text(
                        'Continue as Guest',
                        style: TextStyle(
                          fontSize: 22,
                          color: AppTheme.bgColorScreen,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          PageTransition(
                            type: PageTransitionType.topToBottom,
                            child: Home(
                              isUser: false,
                            ),
                          ),
                          // CupertinoPageRoute(
                          //   builder: (BuildContext context) => Login(),
                          // ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
