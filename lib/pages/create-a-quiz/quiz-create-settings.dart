import 'package:animated_button/animated_button.dart';
import 'package:direct_select_flutter/direct_select_item.dart';
import 'package:direct_select_flutter/direct_select_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:trivia_app/pages/create-a-quiz/quiz-create-questions.dart';
import 'package:trivia_app/theme/theme.dart';
import 'package:trivia_app/widgets/textfield-dropdown-bool.dart';
import 'package:trivia_app/widgets/textfield-dropdown-difficulty.dart';
import 'package:trivia_app/widgets/textfield-dropdown-search-category.dart';
import 'package:trivia_app/widgets/textfield-rounded.dart';
import 'package:dropdown_search/dropdown_search.dart';

class QuizCreateSettings extends StatefulWidget {
  @override
  _QuizCreateSettingsState createState() => _QuizCreateSettingsState();
}

class _QuizCreateSettingsState extends State<QuizCreateSettings> {
  final contTitle = TextEditingController();
  final contCategory = TextEditingController();
  final contDifficulty = TextEditingController();
  final contIsRandom = TextEditingController();

  @override
  void initState() {
    Fluttertoast.showToast(msg: "Field in all the quiz settings");
    super.initState();
  }

  @override
  void dispose() {
    contTitle.dispose();
    contCategory.dispose();
    contDifficulty.dispose();
    contIsRandom.dispose();
    super.dispose();
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
          "Quiz Settings",
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
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        children: [
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
            hintText: 'Enter a title for quiz',
            textAlign: TextAlign.start,
            controller: contTitle,
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
          TextFieldDropdownSearch(
            hintText: "Pick quiz category",
            controller: contCategory,
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
          TextFieldDropdownDifficulty(
            hintText: "Pick quiz difficulty",
            controller: contDifficulty,
          ),
          //isRandom
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Text(
              "Do you want to randomize the question order?",
              style: TextStyle(
                color: AppTheme.text,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          TextFieldDropdownBool(
            hintText: "Randomize quiz order",
            controller: contIsRandom,
          ),
          DirectSelectList<String>(
            values: ["Yes", "No"],
            itemBuilder: (String value) => DirectSelectItem<String>(
                itemHeight: 56,
                value: value,
                itemBuilder: (context, value) {
                  return Text(value);
                }),
            focusedItemDecoration: BoxDecoration(
              border: BorderDirectional(
                bottom: BorderSide(width: 1, color: Colors.black12),
                top: BorderSide(width: 1, color: Colors.black12),
              ),
            ),
            onItemSelectedListener: (item, index, context) {
              print("item selected: $item");
            },
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: AnimatedButton(
              color: AppTheme.white,
              width: size.width * 0.8,
              child: Text(
                'Continue',
                style: TextStyle(
                  color: AppTheme.bgColorScreen,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onPressed: () {
                if (contTitle.text == "") {
                  Fluttertoast.showToast(msg: "Please field in the quiz title");
                } else {
                  bool isRandom = true;
                  if (contIsRandom.text == "Yes") {
                    isRandom = true;
                  } else {
                    isRandom = false;
                  }

                  Map<String, dynamic> dataMap = {
                    "title": contTitle.text,
                    "category": contCategory.text,
                    "isRandom": isRandom,
                    "difficulty": contDifficulty.text,
                  };

                  Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (BuildContext context) =>
                          QuizCreateQuestions(dataMap: dataMap),
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
