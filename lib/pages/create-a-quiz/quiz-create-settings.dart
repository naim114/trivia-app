import 'package:animated_button/animated_button.dart';
import 'package:direct_select_flutter/direct_select_item.dart';
import 'package:direct_select_flutter/direct_select_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:trivia_app/pages/create-a-quiz/quiz-create-questions.dart';
import 'package:trivia_app/theme/theme.dart';
import 'package:trivia_app/widgets/textfield-rounded.dart';
import 'package:dropdown_search/dropdown_search.dart';

class QuizCreateSettings extends StatefulWidget {
  @override
  _QuizCreateSettingsState createState() => _QuizCreateSettingsState();
}

class _QuizCreateSettingsState extends State<QuizCreateSettings> {
  final contTitle = TextEditingController();
  final contQNum = TextEditingController();
  String dropdownCategory = 'Education';
  String dropdownDifficulty = 'Easy';
  String dropdownRandom = 'No';

  @override
  void initState() {
    Fluttertoast.showToast(msg: "Field in all the quiz settings");
    super.initState();
  }

  @override
  void dispose() {
    contTitle.dispose();
    contQNum.dispose();
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
        // leading: IconButton(
        //   onPressed: () {
        //     Navigator.pop(context);
        //   },
        //   icon: Icon(Icons.arrow_back_ios),
        // ),
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
          DropdownButtonFormField<String>(
            value: dropdownCategory,
            style: const TextStyle(color: AppTheme.text),
            decoration: InputDecoration(
              hintText: "Category",
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
                dropdownCategory = newValue!;
              });
            },
            items: <String>[
              "Education",
              "Music",
              "Movies",
              "History",
              "Cultures",
              "Geography",
              "Sports",
              "Politics",
            ].map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
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
          DropdownButtonFormField<String>(
            value: dropdownDifficulty,
            style: const TextStyle(color: AppTheme.text),
            decoration: InputDecoration(
              hintText: "Difficulty",
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
                dropdownDifficulty = newValue!;
              });
            },
            items: <String>[
              "Easy",
              "Medium",
              "Hard",
              "Extreme",
            ].map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
          //Randomize Quiz
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
          DropdownButtonFormField<String>(
            value: dropdownRandom,
            style: const TextStyle(color: AppTheme.text),
            decoration: InputDecoration(
              hintText: "Randomize Quiz",
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
                dropdownRandom = newValue!;
              });
            },
            items: <String>[
              "Yes",
              "No",
            ].map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
          //Question number
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Text(
              "Quiz Number",
              style: TextStyle(
                color: AppTheme.text,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          TextFieldRounded(
            hintText: 'Enter number of question for the quiz',
            textAlign: TextAlign.start,
            controller: contQNum,
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          ),
          //Submit button
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
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
                  // print("dropdownCategory: $dropdownCategory");
                  // print("dropdownDifficulty: $dropdownDifficulty");
                  // print("dropdownRandom: $dropdownRandom");

                  if (contTitle.text == "" || contQNum.text == "") {
                    Fluttertoast.showToast(
                        msg: "Please field in the quiz title");
                  } else {
                    bool isRandom = true;
                    if (dropdownRandom == "Yes") {
                      isRandom = true;
                    } else {
                      isRandom = false;
                    }

                    Map<String, dynamic> dataMap = {
                      "title": contTitle.text,
                      "category": dropdownCategory,
                      "isRandom": isRandom,
                      "difficulty": dropdownDifficulty,
                      "questionNum": contQNum.text,
                    };

                    print("===> ===> ===> ===> DATA MAP ==> ===> ===> ===>");
                    print(dataMap);
                    print("===> ===> ===> ===> DATA MAP ==> ===> ===> ===>");

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) =>
                            QuizCreateQuestions(dataMap: dataMap),
                      ),
                    );
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
