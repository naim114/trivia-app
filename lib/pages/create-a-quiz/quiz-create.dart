import 'package:flutter/material.dart';
import 'package:trivia_app/theme/theme.dart';
import 'package:trivia_app/widgets/textfield-rounded.dart';

class QuizCreate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppTheme.primary,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "Create a Quiz",
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
          icon: Icon(Icons.arrow_back_ios_new),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        children: [
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
          ),
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
          ),
        ],
      ),
    );
  }
}
