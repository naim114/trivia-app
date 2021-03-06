import 'package:animated_button/animated_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:trivia_app/pages/answer-a-quiz/quiz-answer-settings.dart';
import 'package:trivia_app/pages/create-a-quiz/quiz-create-settings.dart';
import 'package:trivia_app/theme/theme.dart';

class Home extends StatelessWidget {
  final bool isUser;

  const Home({
    Key? key,
    this.isUser = false,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppTheme.bgColorScreen,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
      ),
      body: Container(
        child: Padding(
          // padding: const EdgeInsets.all(8.0),
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Padding(
              //   padding: const EdgeInsets.all(10.0),
              //   child: Center(
              //     child: TextLiquidFill(
              //       text: 'Triviazilla',
              //       waveColor: AppTheme.white,
              //       boxBackgroundColor: AppTheme.bgColorScreen,
              //       textStyle: TextStyle(
              //         fontSize: size.height * 0.05,
              //         fontWeight: FontWeight.bold,
              //         fontFamily: "RobotoSlab",
              //       ),
              //       boxHeight: size.height * 0.1,
              //       boxWidth: size.width * 0.9,
              //     ),
              //   ),
              // ),
              Text(
                "Triviazilla",
                style: TextStyle(
                  fontSize: size.height * 0.05,
                  fontWeight: FontWeight.bold,
                  fontFamily: "RobotoSlab",
                  color: AppTheme.white,
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
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: AnimatedButton(
                  color: AppTheme.secondary,
                  width: size.width * 0.8,
                  child: Text(
                    'Answer a Quiz',
                    style: TextStyle(
                      color: AppTheme.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => QuizAnswerSettings(),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: AnimatedButton(
                  color: AppTheme.secondary,
                  width: size.width * 0.8,
                  child: Text(
                    'Create a Quiz',
                    style: TextStyle(
                      color: AppTheme.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (BuildContext context) => QuizCreateSettings(),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: AnimatedButton(
                  color: AppTheme.white,
                  width: size.width * 0.8,
                  child: Text(
                    'My Score',
                    style: TextStyle(
                      color: AppTheme.bgColorScreen,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () {
                    // Navigator.push(
                    //   context,
                    //   CupertinoPageRoute(
                    //     builder: (BuildContext context) => ComingSoon(),
                    //   ),
                    //   // PageTransition(
                    //   //   type: PageTransitionType.rightToLeft,
                    //   //   child: ComingSoon(),
                    //   // ),
                    // );
                    Fluttertoast.showToast(
                        msg: "Creating an account is unavailable right now");
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
