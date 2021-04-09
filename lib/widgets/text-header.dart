import 'package:flutter/material.dart';
import 'package:trivia_app/theme/theme.dart';

class TextHeader extends StatelessWidget {
  final String text;
  final double fontSize;

  const TextHeader({
    Key? key,
    required this.text,
    this.fontSize = 20,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: AppTheme.header,
        fontSize: fontSize,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
