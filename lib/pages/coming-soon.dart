import 'package:flutter/material.dart';

class ComingSoon extends StatefulWidget {
  final String text;

  const ComingSoon({
    Key? key,
    this.text = 'Coming Soon. Nanti aku buat lahh.',
  }) : super(key: key);
  @override
  _ComingSoonState createState() => _ComingSoonState();
}

class _ComingSoonState extends State<ComingSoon> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.grey[200],
        child: Center(
          child: GestureDetector(
            child: Text(widget.text),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ),
      ),
    );
  }
}
