import 'package:animated_button/animated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:material_dialogs/material_dialogs.dart';
import 'package:material_dialogs/widgets/buttons/icon_button.dart';
import 'package:trivia_app/pages/create-a-quiz/quiz-create-finalize.dart';
import 'package:trivia_app/theme/theme.dart';
import 'package:trivia_app/widgets/textfield-rounded.dart';

class QuizCreateReview extends StatefulWidget {
  final Map<String, dynamic> dataMap;

  const QuizCreateReview({
    Key? key,
    required this.dataMap,
  }) : super(key: key);

  @override
  _QuizCreateReviewState createState() => _QuizCreateReviewState();
}

class _QuizCreateReviewState extends State<QuizCreateReview> {
  @override
  void initState() {
    print("===> ===> ===> ===> DATA MAP ==> ===> ===> ===>");
    print("dataMap: ${widget.dataMap}");
    print("===> ===> ===> ===> DATA MAP ==> ===> ===> ===>");
    print("title: ${widget.dataMap["title"]}");

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List<Map<String, Map<String, bool>>> questionSetList =
        widget.dataMap["questions"];
    print("questionSetList: $questionSetList");
    return Scaffold(
      backgroundColor: AppTheme.primary,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        elevation: 0,
        title: Text(
          "Quiz Review",
          style: TextStyle(
            color: AppTheme.white,
            fontFamily: "Oxygen",
            fontWeight: FontWeight.bold,
          ),
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
                  "You halfway there...",
                  style: TextStyle(
                    color: AppTheme.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 0),
                child: Text(
                  "Review your quiz before submitting it. Slide to the left questions to view their answers.",
                  style: TextStyle(
                    color: AppTheme.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ),
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
                initialValue: widget.dataMap["title"],
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
                initialValue: widget.dataMap["category"],
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
                initialValue: widget.dataMap["difficulty"],
                enabled: false,
              ),
              //random
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  "Randomize Quiz",
                  style: TextStyle(
                    color: AppTheme.text,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
              TextFieldRounded(
                hintText: 'Randomize Quiz',
                textAlign: TextAlign.start,
                initialValue: widget.dataMap["isRandom"] ? "Yes" : "No",
                enabled: false,
              ),
              //Questions and answers
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  "Questions and Answers",
                  style: TextStyle(
                    color: AppTheme.text,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
              Container(
                child: Column(
                  children: List.generate(
                    questionSetList.length,
                    (index) {
                      Map<String, Map<String, bool>> questionSet =
                          questionSetList[index];
                      String question = questionSet.keys.elementAt(0);
                      Map<String, bool> ansMap = questionSet.values.first;
                      List<String> ansList = ansMap.keys.toList();
                      // ansList.join('x\n');
                      String ansListString =
                          ansList.map((val) => val.trim()).join(',\n');

                      print("questionSet: $questionSet");
                      print("firstkey: ${questionSet.keys.elementAt(0)}");
                      print("ansList: $ansListString");

                      return Slidable(
                        actionPane: SlidableDrawerActionPane(),
                        actionExtentRatio: 0.25,
                        child: Container(
                          // color: Colors.grey[200],
                          color: Colors.white,
                          child: ListTile(
                            title: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Text(question),
                            ),
                            trailing: Icon(Icons.swipe),
                          ),
                        ),
                        secondaryActions: <Widget>[
                          IconSlideAction(
                            caption: 'View More',
                            color: Colors.black45,
                            icon: Icons.more_horiz,
                            onTap: () => Dialogs.bottomMaterialDialog(
                              title: question,
                              msg: ansListString,
                              color: Colors.white,
                              context: context,
                              actions: [
                                IconsButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  text: 'Close',
                                  iconData: Icons.close,
                                  textStyle: TextStyle(color: Colors.grey),
                                  iconColor: Colors.grey,
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: AnimatedButton(
                    color: AppTheme.secondary,
                    width: size.width * 0.9,
                    child: Text(
                      'Submit',
                      style: TextStyle(
                        color: AppTheme.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed: () {
                      print("===> ===> ===> ===> DATA MAP ==> ===> ===> ===>");
                      print("dataMap: ${widget.dataMap}");
                      print("===> ===> ===> ===> DATA MAP ==> ===> ===> ===>");
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => QuizCreateFinalize(
                            dataMap: widget.dataMap,
                          ),
                        ),
                      );
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
