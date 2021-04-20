import 'package:flutter/material.dart';

class QuizAnswerFrame extends StatefulWidget {
  final Map<String, dynamic> dataMap;

  const QuizAnswerFrame({
    Key? key,
    required this.dataMap,
  }) : super(key: key);
  @override
  _QuizAnswerFrameState createState() => _QuizAnswerFrameState();
}

class _QuizAnswerFrameState extends State<QuizAnswerFrame> {
  final PageController pageController = PageController(initialPage: 0);

  @override
  void initState() {
    print(
        "calling from QuizAnswerFrame\n00000000000000000000 dataMap Result 00000000000000000000\n${widget.dataMap}\n00000000000000000000 dataMap Result 00000000000000000000");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      pageSnapping: false,
      physics: NeverScrollableScrollPhysics(),
      children: [
        Scaffold(
          body: Center(
            child: Text("asdasd"),
          ),
        ),
      ],
    );
  }
}
