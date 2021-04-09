import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trivia_app/pages/register.dart';
import 'package:trivia_app/theme/theme.dart';
import 'package:trivia_app/widgets/button-simple.dart';
import 'package:trivia_app/widgets/input.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
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
                    "Create and answer sets of question easily.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: "Oxygen",
                      fontWeight: FontWeight.bold,
                      fontSize: size.height * 0.02,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 40, left: 24.0, right: 24.0, bottom: 32),
                    child: Card(
                      elevation: 5,
                      clipBehavior: Clip.antiAlias,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                      child: Column(
                        children: [
                          Container(
                            // height: MediaQuery.of(context).size.height * 0.55,
                            color: Color.fromRGBO(244, 245, 247, 1),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Center(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 10),
                                        child: Text(
                                          "Please login to go to your account",
                                          style: TextStyle(
                                            color: AppTheme.text,
                                            fontWeight: FontWeight.w200,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Input(
                                            placeholder: "Username",
                                            prefixIcon: Icon(Icons.person),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Input(
                                            placeholder: "Password",
                                            prefixIcon: Icon(Icons.lock),
                                            obscureText: true,
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 10),
                                          child: ButtonSimple(
                                            text: "Log In",
                                            buttonColor: AppTheme.bgColorScreen,
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 5),
                                          child: TextButton(
                                            onPressed: () {
                                              Navigator.push(
                                                context,
                                                // PageTransition(
                                                //   type: PageTransitionType
                                                //       .leftToRight,
                                                //   child: Register(),
                                                //   // builder: (BuildContext context) => Login(),
                                                // ),
                                                CupertinoPageRoute(
                                                  builder:
                                                      (BuildContext context) =>
                                                          Register(),
                                                ),
                                              );
                                            },
                                            child: Text(
                                              "Create an Account",
                                              style:
                                                  TextStyle(color: Colors.blue),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 5),
                                          child: TextButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: Text(
                                              "Back to main page",
                                              style:
                                                  TextStyle(color: Colors.blue),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
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
