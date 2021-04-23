import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:trivia_app/theme/theme.dart';
import 'package:trivia_app/widgets/button-bouncing.dart';

class QuizAnswerAQuestion extends StatelessWidget {
  final int index;
  final Map<String, dynamic> questionSet;
  final Function(bool) submitAnswers;

  const QuizAnswerAQuestion({
    Key? key,
    required this.index,
    required this.questionSet,
    required this.submitAnswers,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String question = "No Questions";
    List<String> answers = [];
    List<bool> answersBool = [];
    questionSet.keys.forEach((key) {
      question = key;
    });
    List<dynamic> answerSet = questionSet.values.toList();

    answerSet.forEach((anAnswerMap) {
      anAnswerMap.forEach((key, value) {
        answers.add(key);
        answersBool.add(value);
      });
    });
    // questionSet.forEach((key, value) {
    //   answers.add(key);
    //   answersBool.add(value);
    // });
    print("answerSet: $answerSet");
    print("answers: $answers");
    print("answersBool: $answersBool");
    // Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppTheme.primary,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        elevation: 0,
        title: Text(
          "Quiz Questions #${index + 1}",
          style: TextStyle(
            color: AppTheme.white,
            fontFamily: "Oxygen",
            fontWeight: FontWeight.bold,
          ),
        ),
        automaticallyImplyLeading: false,
        iconTheme: IconThemeData(
          color: AppTheme.white,
        ),
        actionsIconTheme: IconThemeData(
          color: AppTheme.white,
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Text(
                question,
                // "What is your frightened the most when you dreaming about seeing a giant tarantula and a horse trying to mate?",
                style: TextStyle(
                  color: AppTheme.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
            Column(
              children: List.generate(
                answers.length,
                (index) => BouncingButton(
                  text: answers[index],
                  onPressed: () {
                    Fluttertoast.showToast(
                        msg: "You've picked ${answers[index]}");
                    submitAnswers(answersBool[index]);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
