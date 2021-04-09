import 'package:flutter/material.dart';
import 'package:trivia_app/theme/theme.dart';

class ButtonSimple extends StatelessWidget {
  final String text;
  final Color textColor, buttonColor;
  const ButtonSimple({
    Key? key,
    required this.text,
    this.textColor = AppTheme.white,
    this.buttonColor = AppTheme.secondary,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        backgroundColor: buttonColor,
        textStyle: TextStyle(
          color: textColor,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4.0),
        ),
      ),
      onPressed: () {},
      child: Padding(
        padding: EdgeInsets.only(
          left: 16.0,
          right: 16.0,
          top: 5,
          bottom: 5,
        ),
        child: Text(
          text,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16.0,
            color: textColor,
          ),
        ),
      ),
    );
  }
}
