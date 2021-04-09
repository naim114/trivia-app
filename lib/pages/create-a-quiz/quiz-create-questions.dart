import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:trivia_app/theme/theme.dart';
import 'package:trivia_app/widgets/textfield-rounded.dart';

class QuizCreateQuestions extends StatefulWidget {
  final Map<String, dynamic> dataMap;
  const QuizCreateQuestions({
    Key? key,
    required this.dataMap,
  }) : super(key: key);
  @override
  _QuizCreateQuestionsState createState() => _QuizCreateQuestionsState();
}

class _QuizCreateQuestionsState extends State<QuizCreateQuestions> {
  final contQuestion = TextEditingController();
  final contAnswer = TextEditingController();
  final contIsCorrect = TextEditingController();

  final List<Map<String, Map<bool, String>>> questions = [];
  @override
  void initState() {
    Fluttertoast.showToast(
        msg: "Enter questions and the answers for your quiz");
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
        title: Text(
          "Quiz Questions",
          style: TextStyle(
            color: AppTheme.white,
            fontFamily: "Oxygen",
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Column(
          // padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text(
                "Enter a question and their answers and tap Add button. You can view your entered questions and answers below.",
                style: TextStyle(
                  color: AppTheme.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text(
                "Question",
                style: TextStyle(
                  color: AppTheme.text,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            TextFieldRounded(
              hintText: 'Enter a question',
              textAlign: TextAlign.start,
              controller: contQuestion,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text(
                "Answer",
                style: TextStyle(
                  color: AppTheme.text,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            TextFieldRounded(
              hintText: 'Enter an answer',
              textAlign: TextAlign.start,
              controller: contAnswer,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text(
                "Correct/Incorrect",
                style: TextStyle(
                  color: AppTheme.text,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            // TextFieldRounded(
            //   hintText: 'Enter an answer',
            //   textAlign: TextAlign.start,
            //   controller: contAnswer,
            // ),
          ],
        ),
      ),
    );
  }
}
