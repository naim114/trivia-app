import 'dart:math';

import 'package:flutter/material.dart';
import 'package:trivia_app/pages/answer-a-quiz/quiz-answer-a-question.dart';

class QuizAnswerFrame extends StatefulWidget {
  final Map<String, dynamic> dataMap;

  const QuizAnswerFrame({
    Key? key,
    required this.dataMap,
  }) : super(key: key);
  @override
  _QuizAnswerFrameState createState() => _QuizAnswerFrameState();
}

class _QuizAnswerFrameState extends State<QuizAnswerFrame> {
  final PageController pageController = PageController(initialPage: 0);

  @override
  void initState() {
    print(
        "calling from QuizAnswerFrame\n00000000000000000000 dataMap Result 00000000000000000000\n${widget.dataMap}\n00000000000000000000 dataMap Result 00000000000000000000");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    int questionNum = widget.dataMap["questionNum"];
    print("questionNum: ${widget.dataMap["questionNum"].runtimeType}");
    List<dynamic> questionsList = widget.dataMap["questions"];
    print("questionsList: $questionsList");
    return PageView(
      controller: pageController,
      // pageSnapping: false,
      // physics: NeverScrollableScrollPhysics(),
      // children: List.generate(
      //   questionNum,
      //   (index) => QuizAnswerAQuestion(index: index),
      // ),

      children: List.generate(
        questionNum,
        (index) {
          // Map<String, Map<String, bool>> aQuestion = questionsList[index];
          //TODO test randomList
          List<dynamic> randomList = shuffle(questionsList);

          Map<String, dynamic> aQuestion = randomList[index];
          print("question #${index + 1}: $aQuestion");
          return QuizAnswerAQuestion(
            index: index,
            questionSet: aQuestion,
            submitAnswers: (bool) {
              //TODO test if picked answer return their right bool
            },
          );
        },
      ),
    );
  }

  List shuffle(List items) {
    var random = new Random();

    // Go through all elements.
    for (var i = items.length - 1; i > 0; i--) {
      // Pick a pseudorandom number according to the list length
      var n = random.nextInt(i + 1);

      var temp = items[i];
      items[i] = items[n];
      items[n] = temp;
    }

    return items;
  }
}
