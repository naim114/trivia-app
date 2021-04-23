import 'dart:math';

import 'package:animated_button/animated_button.dart';
import 'package:flutter/material.dart';
import 'package:trivia_app/pages/home.dart';
import 'package:trivia_app/theme/theme.dart';

class QuizAnswerFinish extends StatelessWidget {
  final int questionNum, score;
  final Map<String, bool> answeredQuestion;
  const QuizAnswerFinish({
    Key? key,
    required this.questionNum,
    required this.score,
    required this.answeredQuestion,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("answeredQuestion: $answeredQuestion");
    Size size = MediaQuery.of(context).size;

    List<String> perfectGIF = [
      'https://media.giphy.com/media/1yiPWNsQ1vq7V90fRY/giphy.gif',
      'https://media.giphy.com/media/26ufq9mryvc5HI27m/giphy.gif',
      'https://media.giphy.com/media/LOcPt9gfuNOSI/giphy.gif',
    ];
    List<String> goodGIF = [
      'https://media.giphy.com/media/tTKwUCYz1DjGO2mKJJ/giphy.gif',
      'https://media.giphy.com/media/7zLhR58ckkJtbmqmN2/giphy.gif',
      'https://media.giphy.com/media/tkApIfibjeWt1ufWwj/giphy.gif',
      'https://media.giphy.com/media/dVdIu1HNxeKyqzkgPA/giphy.gif',
      'https://media.giphy.com/media/a9imQoghMq5IQ/giphy.gif',
    ];
    List<String> badGIF = [
      'https://media.giphy.com/media/Y4n2kBbEYjeGIvQSA1/giphy.gif',
      'https://media.giphy.com/media/15UR4cUa8Vbyw/giphy.gif',
      'https://media.giphy.com/media/15UR4cUa8Vbyw/giphy.gif',
      'https://media.giphy.com/media/3o6Zt2qh8vSNFH30SQ/giphy.gif',
      'https://media.giphy.com/media/eveLVPcHcbl0A/giphy.gif',
    ];

    List<String> perfectWord = [
      'AMAZINGGG!',
      'Awesome!!',
      'Perfect!',
    ];
    List<String> goodWord = [
      'Good Job!',
      'Not so bad...',
      'Meh, good enough..',
      'Still good!',
      'Great job!',
    ];
    List<String> tryWord = [
      'Its okay, try again..',
      'Try again',
      'Better luck next time!',
      'Not so good :(',
      'No words...',
    ];

    String reactWord = 'Meh...';
    String reactGIF = 'https://media.giphy.com/media/eveLVPcHcbl0A/giphy.gif';
    final _random = Random();

    if (questionNum == score) {
      reactGIF = perfectGIF[_random.nextInt(perfectGIF.length)];
      reactWord = perfectWord[_random.nextInt(perfectWord.length)];
    } else if (score >= (questionNum / 2)) {
      print("good score!");
      reactGIF = goodGIF[_random.nextInt(goodGIF.length)];
      reactWord = goodWord[_random.nextInt(goodWord.length)];
    } else {
      print("bad score!");
      reactGIF = badGIF[_random.nextInt(badGIF.length)];
      reactWord = tryWord[_random.nextInt(tryWord.length)];
    }
    return Scaffold(
      backgroundColor: AppTheme.secondary,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                reactGIF,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text(
                  "$score/$questionNum",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 50,
                    fontFamily: "RobotoSlab",
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: Text(
                  reactWord,
                  style: TextStyle(
                    color: AppTheme.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Text(
                "Tap \"Finish\" button to back to home.",
                style: TextStyle(
                  color: AppTheme.text,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
                textAlign: TextAlign.center,
              ),
              //TODO add review answer module
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: AnimatedButton(
                  color: AppTheme.primary,
                  width: size.width * 0.8,
                  child: Text(
                    'Finish',
                    style: TextStyle(
                      color: AppTheme.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => Home(),
                      ),
                    );
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
