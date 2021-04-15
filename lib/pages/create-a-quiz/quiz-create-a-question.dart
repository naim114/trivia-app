import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:trivia_app/pages/create-a-quiz/quiz-create-settings.dart';
import 'package:trivia_app/theme/theme.dart';
import 'package:trivia_app/widgets/button-simple.dart';
import 'package:trivia_app/widgets/textfield-rounded.dart';

class QuizCreateAQuestion extends StatefulWidget {
  final int index;
  final Function(Map<String, Map<String, bool>>) onSubmit;

  const QuizCreateAQuestion({
    Key? key,
    required this.index,
    required this.onSubmit,
  }) : super(key: key);
  @override
  _QuizCreateAQuestionState createState() => _QuizCreateAQuestionState();
}

class _QuizCreateAQuestionState extends State<QuizCreateAQuestion> {
  final contQuestion = TextEditingController();
  final contAnswer = TextEditingController();
  String dropdownCorrectIncorrect = 'Correct';

  final List<String> answers = <String>[];
  final List<String> correctOrIncorrect = <String>[];

  Map<String, bool> ansMap = {};
  Map<String, Map<String, bool>> qMap = {};

  void addItemToList() {
    setState(() {
      answers.add(contAnswer.text);
      correctOrIncorrect.add(dropdownCorrectIncorrect);

      bool answerIndicator = true;
      if (dropdownCorrectIncorrect == "Correct") {
        answerIndicator = true;
      } else if (dropdownCorrectIncorrect == "Incorrect") {
        answerIndicator = false;
      }
      ansMap[contAnswer.text] = answerIndicator;
      qMap[contQuestion.text] = ansMap;
    });
  }

  @override
  void initState() {
    Fluttertoast.showToast(
        msg: "Enter questions and the answers for your quiz");
    print("currently on index: ${widget.index}");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppTheme.primary,
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppTheme.text,
        onPressed: () {
          print("answers: $answers");
          if (answers.isEmpty) {
            print("empty answers");
          }

          // print("t or f list: $trueOrFalse");
          print("answers map: $ansMap");

          if (contQuestion.text != "" && answers.isNotEmpty) {
            print("question map: $qMap");
            widget.onSubmit(qMap);
          } else {
            Fluttertoast.showToast(msg: "Please complete your question!");
          }
        },
        child: Icon(Icons.arrow_forward_ios),
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "Quiz Questions #${widget.index + 1}",
          style: TextStyle(
            color: AppTheme.white,
            fontFamily: "Oxygen",
            fontWeight: FontWeight.bold,
          ),
        ),
        iconTheme: IconThemeData(
          color: AppTheme.white,
        ),
        actionsIconTheme: IconThemeData(
          color: AppTheme.white,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 0),
                child: Text(
                  "Enter a question and tap \"Add Answers\" to add answers for this question. You can view your answers below. Double tab answer to delete it. After setting up the question tap the floating button.",
                  style: TextStyle(
                    color: AppTheme.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
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
              //Enter an answer
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
              //true or not
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
              DropdownButtonFormField<String>(
                value: dropdownCorrectIncorrect,
                style: const TextStyle(color: AppTheme.text),
                decoration: InputDecoration(
                  hintText: "Correct/Incorrect",
                  hintStyle: const TextStyle(fontSize: 16),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                      width: 0,
                      style: BorderStyle.none,
                    ),
                  ),
                  filled: true,
                  contentPadding: const EdgeInsets.all(16),
                  fillColor: AppTheme.white,
                ),
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownCorrectIncorrect = newValue!;
                  });
                },
                items: <String>[
                  "Correct",
                  "Incorrect",
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              //add an answer button
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Center(
                  child: ButtonSimple(
                    text: "Add Answer",
                    onPressed: () {
                      if (answers.contains(contAnswer.text)) {
                        Fluttertoast.showToast(
                            msg: "You can't have more than two same answers!");
                      } else {
                        if (contAnswer.text != "") {
                          addItemToList();
                        } else {
                          Fluttertoast.showToast(msg: "Please enter an answer");
                        }
                      }
                    },
                  ),
                ),
              ),
              // view answers
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  // alignment: WrapAlignment.spaceAround,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "View Your Answer",
                      style: TextStyle(
                        color: AppTheme.text,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Fluttertoast.showToast(msg: "List cleared");
                        setState(() {
                          answers.clear();
                          correctOrIncorrect.clear();
                        });
                      },
                      child: Text("Clear List"),
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                color: AppTheme.white,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView.builder(
                    padding: const EdgeInsets.all(8),
                    itemCount: answers.length,
                    shrinkWrap: true,
                    // physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      return answers.isNotEmpty
                          ? GestureDetector(
                              onDoubleTap: () {
                                Fluttertoast.showToast(
                                    msg: "${answers[index]} deleted");
                                setState(() {
                                  ansMap.remove(answers[index]);
                                  answers.removeAt(index);
                                  correctOrIncorrect.removeAt(index);
                                });
                              },
                              child: Container(
                                margin: EdgeInsets.all(2),
                                color: index % 2 == 0
                                    ? AppTheme.secondary
                                    : AppTheme.third,
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        answers[index],
                                        style: TextStyle(
                                          fontSize: 18,
                                          // fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        correctOrIncorrect[index],
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: correctOrIncorrect[index] ==
                                                  "Correct"
                                              ? Colors.greenAccent[400]
                                              : Colors.red[700],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            )
                          : Text("none");
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
