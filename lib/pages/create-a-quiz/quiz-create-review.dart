import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:material_dialogs/material_dialogs.dart';
import 'package:material_dialogs/widgets/buttons/icon_button.dart';
import 'package:material_dialogs/widgets/buttons/icon_outline_button.dart';
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
    List<Map<String, Map<String, bool>>> questionSetList =
        widget.dataMap["questions"];
    print("questionSetList: $questionSetList");
    return Scaffold(
      backgroundColor: AppTheme.primary,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
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
                      // List<Map<String, Map<String, bool>>> questionSetList =
                      //     widget.dataMap["questions"];
                      Map<String, Map<String, bool>> questionSet =
                          questionSetList[index];
                      String question = questionSet.keys.elementAt(0);
                      Map<String, bool> ansMap = questionSet.values.first;
                      print("questionSet: $questionSet");
                      print("firstkey: ${questionSet.keys.elementAt(0)}");
                      List<String> ansList = ansMap.keys.toList();
                      ansList.forEach((element) {
                        element = element + "\n";
                      });
                      print("ansList: $ansList");
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
                            trailing: Icon(Icons.swipe_rounded),
                          ),
                        ),
                        secondaryActions: <Widget>[
                          IconSlideAction(
                            caption: 'View More',
                            color: Colors.black45,
                            icon: Icons.more_horiz,
                            onTap: () => Dialogs.bottomMaterialDialog(
                              title: question,
                              msg: ansList
                                  .toString(), //TODO display answer list heere!
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
            ],
          ),
        ),
      ),
    );
  }
}
