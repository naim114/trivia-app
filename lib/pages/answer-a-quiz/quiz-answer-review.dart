import 'dart:convert';

import 'package:animated_button/animated_button.dart';
import 'package:flutter/material.dart';
import 'package:trivia_app/pages/answer-a-quiz/quiz-answer-ready.dart';
import 'package:trivia_app/theme/theme.dart';
import 'package:trivia_app/widgets/textfield-rounded.dart';

class QuizAnswerReview extends StatefulWidget {
  final String qrResult;

  const QuizAnswerReview({
    Key? key,
    required this.qrResult,
  }) : super(key: key);

  @override
  _QuizAnswerReviewState createState() => _QuizAnswerReviewState();
}

class _QuizAnswerReviewState extends State<QuizAnswerReview> {
  @override
  void initState() {
    print(
        ">>>>>>>>>>>>>> QR Code Result >>>>>>>>>>>>>>>>>>>>>\n${widget.qrResult}\n>>>>>>>>>>>>>> QR Code Result >>>>>>>>>>>>>>>>>>>>>");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Map<String, dynamic> dataMap = jsonDecode(widget.qrResult);

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
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text(
                "Reading QR Code Success!",
                style: TextStyle(
                  color: AppTheme.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text(
                "Review the quiz before answering it.",
                style: TextStyle(
                  color: AppTheme.text,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.symmetric(vertical: 10),
            //   child: Text(
            //     // "Result: ${dataMap.toString()}",
            //     "$dataMap",
            //     style: TextStyle(
            //       color: AppTheme.text,
            //       fontWeight: FontWeight.bold,
            //       fontSize: 18,
            //     ),
            //   ),
            // ),
            //Quiz Title
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text(
                "Quiz Title",
                style: TextStyle(
                  color: AppTheme.text,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            TextFieldRounded(
              hintText: 'Quiz Title',
              textAlign: TextAlign.start,
              initialValue: dataMap["title"],
              enabled: false,
            ),
            //Category
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text(
                "Category",
                style: TextStyle(
                  color: AppTheme.text,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            TextFieldRounded(
              hintText: 'Category',
              textAlign: TextAlign.start,
              initialValue: dataMap["category"],
              enabled: false,
            ),
            //difficulty
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text(
                "Difficulty",
                style: TextStyle(
                  color: AppTheme.text,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            TextFieldRounded(
              hintText: 'Difficulty',
              textAlign: TextAlign.start,
              initialValue: dataMap["difficulty"],
              enabled: false,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30),
              child: AnimatedButton(
                color: AppTheme.white,
                width: size.width * 0.9,
                child: Text(
                  'Continue',
                  style: TextStyle(
                    color: AppTheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => QuizAnswerReady(
                        dataMap: dataMap,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
