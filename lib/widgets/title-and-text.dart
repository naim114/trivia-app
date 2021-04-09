import 'package:flutter/material.dart';
import 'package:trivia_app/theme/theme.dart';

class TitleAndText extends StatelessWidget {
  final String title, text;
  const TitleAndText({
    Key? key,
    required this.title,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            textAlign: TextAlign.start,
            style: TextStyle(
              color: AppTheme.text,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            text,
            textAlign: TextAlign.start,
          ),
        ],
      ),
    );
  }
}
