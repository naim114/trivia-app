import 'dart:math';

import 'package:flutter/material.dart';
import 'package:trivia_app/pages/answer-a-quiz/quiz-answer-a-question.dart';
import 'package:trivia_app/pages/answer-a-quiz/quiz-answer-finish.dart';
import 'package:trivia_app/theme/theme.dart';

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
    print("questionNum: ${widget.dataMap["questionNum"]}");
    List<dynamic> questionsList = widget.dataMap["questions"];
    print("questionsList: $questionsList");
    bool isRandom = widget.dataMap["isRandom"];
    print("isRandom: $isRandom");
    int score = 0;

    List<String> trueGIF = [
      'https://media.giphy.com/media/ummeQH0c3jdm2o3Olp/giphy.gif',
      'https://media.giphy.com/media/3ofT5PzgI9FSn8vPaw/giphy.gif',
      'https://media.giphy.com/media/x88e1awUi05by/giphy.gif',
      'https://media.giphy.com/media/UAXK9VGoJTbdcPgmcJ/giphy.gif',
      'https://media.giphy.com/media/xHMIDAy1qkzNS/giphy.gif',
      'https://media.giphy.com/media/j6ZReIODqJXh5sPLVq/giphy.gif',
      'https://media.giphy.com/media/FlrJh58XGTaAo/giphy.gif',
      'https://media.giphy.com/media/Z6f7vzq3iP6Mw/giphy.gif',
      'https://media.giphy.com/media/ci0uDcGQtBh0k/giphy.gif',
      'https://media.giphy.com/media/5fMlYckytHM4g/giphy.gif',
      'https://media.giphy.com/media/8Odq0zzKM596g/giphy.gif',
    ];
    List<String> trueWord = [
      'Correct!',
      'Nice one!',
      'Nooooooice',
      'Awesome!!',
      'That\'s correct!',
      'Good Job 👍',
      'OH YEAHHH',
      'Hands up 🙌 '
    ];
    List<String> falseGIF = [
      'https://media.giphy.com/media/l4pLY0zySvluEvr0c/giphy.gif',
      'https://media.giphy.com/media/ceeN6U57leAhi/giphy.gif',
      'https://media.giphy.com/media/l4FGuhL4U2WyjdkaY/giphy.gif',
      'https://media.giphy.com/media/9GJ34PEVM5JnCkfPPf/giphy.gif',
      'https://media.giphy.com/media/KCfpWuNnTcLbc3aLvZ/giphy.gif',
      'https://media.giphy.com/media/fH6jipGcugrKrx45az/giphy.gif',
      'https://media.giphy.com/media/Vlw1Dzb1pU0qN3hzOu/giphy.gif',
      'https://media.giphy.com/media/Vlw1Dzb1pU0qN3hzOu/giphy.gif',
      'https://media.giphy.com/media/oQjsQmQKlFDcQ/giphy.gif',
      'https://media.giphy.com/media/l1IY5J4Cfw8JLi40M/giphy.gif',
    ];
    List<String> falseWord = [
      'Incorrect',
      'Wrong!!',
      'Try Again!',
      '👎 👎 👎 👎 👎',
      'That\'s just wrong... try again',
      'Come on, you better than this!',
      'Try again... and again... and again...',
      'False!!'
    ];

    Map<String, bool> answeredQuestion = {};
    return PageView(
      controller: pageController,
      pageSnapping: false,
      physics: NeverScrollableScrollPhysics(),
      children: List.generate(
        questionNum,
        (index) {
          Map<String, dynamic> aQuestion;
          if (isRandom) {
            List<dynamic> randomList = shuffle(questionsList);
            aQuestion = randomList[index];
          }
          aQuestion = questionsList[index];

          print("question #${index + 1}: $aQuestion");
          return QuizAnswerAQuestion(
            index: index,
            questionSet: aQuestion,
            submitAnswers: (bool) async {
              print("Question #${index + 1}: $bool");

              if (bool) score++;
              print("score: $score");

              answeredQuestion[aQuestion.entries.first.key] = bool;

              // pageController.nextPage(
              //   duration: Duration(milliseconds: 777),
              //   curve: Curves.bounceIn,
              // );
              if (index + 1 == questionNum) {
                print("Last index!");

                print("FINAL SCORE: $score / $questionNum");
                Navigator.of(context).popUntil((route) => route.isFirst);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => QuizAnswerFinish(
                      questionNum: questionNum,
                      score: score,
                      answeredQuestion: answeredQuestion,
                    ),
                  ),
                );
              } else {
                print("On to the next page");
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (_) {
                    Future.delayed(Duration(seconds: 3), () {
                      Navigator.of(context).pop(true);
                    });
                    final _random = Random();
                    return Dialog(
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                      child: Container(
                        alignment: FractionalOffset.center,
                        // height: 80.0,
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.network(
                              bool
                                  ? trueGIF[_random.nextInt(trueGIF.length)]
                                  : falseGIF[_random.nextInt(falseGIF.length)],
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Text(
                                // "Correct",
                                bool ? "CORRECT!" : "INCORRECT!",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30,
                                  color: bool ? Colors.green : AppTheme.error,
                                  fontFamily: "RobotoSlab",
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Text(
                              bool
                                  ? trueWord[_random.nextInt(trueWord.length)]
                                  : falseWord[
                                      _random.nextInt(falseWord.length)],
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: AppTheme.white,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
                pageController.nextPage(
                  duration: Duration(milliseconds: 777),
                  curve: Curves.bounceIn,
                );
              }
            },
          );
        },
      ),
    );
  }

  void showResponseAlert() {}

  List shuffle(List items) {
    var random = Random();

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
