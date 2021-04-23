import 'package:animated_button/animated_button.dart';
import 'package:flutter/material.dart';
import 'package:trivia_app/pages/answer-a-quiz/quiz-answer-frame.dart';
import 'package:trivia_app/theme/theme.dart';

class QuizAnswerReady extends StatefulWidget {
  final Map<String, dynamic> dataMap;

  const QuizAnswerReady({
    Key? key,
    required this.dataMap,
  }) : super(key: key);
  @override
  _QuizAnswerReadyState createState() => _QuizAnswerReadyState();
}

class _QuizAnswerReadyState extends State<QuizAnswerReady> {
  @override
  void initState() {
    print(
        "calling from QuizAnswerReady\n00000000000000000000 dataMap Result 00000000000000000000\n${widget.dataMap}\n00000000000000000000 dataMap Result 00000000000000000000");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppTheme.primary,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Answer a Quiz",
          style: TextStyle(
            color: AppTheme.white,
            fontFamily: "Oxygen",
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Image.network(
                  "https://media.giphy.com/media/37QVh74uQ5qeBOh0UF/giphy.gif",
                  width: size.width * 0.7,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  "Ready, Get set and...",
                  style: TextStyle(
                    color: AppTheme.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Text(
                "Tap \"Go!\" button to start answer the quiz read from the QR Code.",
                style: TextStyle(
                  color: AppTheme.text,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
                textAlign: TextAlign.center,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: AnimatedButton(
                  color: AppTheme.secondary,
                  width: size.width * 0.8,
                  child: Text(
                    'Go!',
                    style: TextStyle(
                      color: AppTheme.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).popUntil((route) => route.isFirst);

                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => QuizAnswerFrame(
                          dataMap: widget.dataMap,
                        ),
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
