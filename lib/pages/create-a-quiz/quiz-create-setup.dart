import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:trivia_app/pages/create-a-quiz/quiz-create-a-question.dart';
import 'package:trivia_app/pages/create-a-quiz/quiz-create-review.dart';

class QuizCreateSetup extends StatefulWidget {
  final Map<String, dynamic> dataSettingsMap;
  final int questionNum;
  const QuizCreateSetup({
    Key? key,
    required this.dataSettingsMap,
    required this.questionNum,
  }) : super(key: key);

  @override
  _QuizCreateSetupState createState() => _QuizCreateSetupState();
}

class _QuizCreateSetupState extends State<QuizCreateSetup> {
  @override
  void initState() {
    print("dataSettingsMap received: ${widget.dataSettingsMap}");
    print("questionNum: ${widget.questionNum}");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final PageController pageController = PageController(initialPage: 0);
    List<Map<String, Map<String, bool>>> quizSet = [];
    Map<String, dynamic> dataMap = widget.dataSettingsMap;

    return PageView(
      scrollDirection: Axis.horizontal,
      controller: pageController,
      pageSnapping: false,
      physics: NeverScrollableScrollPhysics(),
      children: List.generate(
        widget.questionNum,
        (index) => QuizCreateAQuestion(
          index: index,
          onSubmit: (aQuestion) {
            print("Question submitted: $aQuestion");
            quizSet.add(aQuestion);
            print("quizSet rn: $quizSet");
            Fluttertoast.showToast(msg: "Question #${index + 1} submitted!");
            // pageController.animateTo(index + 1,
            //     duration: Duration(milliseconds: 1000), curve: Curves.bounceIn);
            print("current index: $index");
            if (index + 1 == widget.questionNum) {
              print("Last index!");
              dataMap["questions"] = quizSet;

              print("===> ===> ===> ===> DATA MAP ==> ===> ===> ===>");
              print("dataMap: $dataMap");
              print("===> ===> ===> ===> DATA MAP ==> ===> ===> ===>");

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => QuizCreateReview(
                    dataMap: dataMap,
                  ),
                ),
              );
            } else {
              print("On to the next page");
              pageController.nextPage(
                duration: Duration(milliseconds: 777),
                curve: Curves.bounceIn,
              );
            }
          },
        ),
      ),
    );
  }
}
