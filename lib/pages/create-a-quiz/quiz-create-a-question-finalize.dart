import 'dart:convert';
import 'dart:typed_data';

import 'package:animated_button/animated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:trivia_app/theme/theme.dart';

class QuizCreateQuestionFinalize extends StatefulWidget {
  final Map<String, dynamic> dataMap;

  const QuizCreateQuestionFinalize({
    Key? key,
    required this.dataMap,
  }) : super(key: key);

  @override
  _QuizCreateQuestionFinalizeState createState() =>
      _QuizCreateQuestionFinalizeState();
}

class _QuizCreateQuestionFinalizeState
    extends State<QuizCreateQuestionFinalize> {
  GlobalKey? key1;
  Uint8List? bytes1;
  GlobalKey globalKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    String jsonDataMap = jsonEncode(widget.dataMap);
    print("xxx xxx xxx xxx JSON DATA MAP ==> xxx xxx xxx");
    print(jsonDataMap);
    print("xxx xxx xxx xxx JSON DATA MAP ==> xxx xxx xxx");

    // Widget generatedQR = WidgetToImage(
    //   builder: (key) {
    //     this.key1 = key;
    //     return Center(
    //       child: Container(
    //         color: Colors.white,
    //         child: QrImage(
    //           data: jsonDataMap,
    //           version: QrVersions.auto,
    //           size: size.height * 0.4,
    //         ),
    //       ),
    //     );
    //   },
    // );

    Widget qrCodeWidget = Center(
      child: Container(
        color: Colors.white,
        child: QrImage(
          data: jsonDataMap,
          version: QrVersions.auto,
          size: size.height * 0.4,
        ),
      ),
    );

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
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Center(
              //   child: Container(
              //     color: Colors.white,
              //     child: QrImage(
              //       data: jsonDataMap,
              //       version: QrVersions.auto,
              //       size: size.height * 0.4,
              //     ),
              //   ),
              // ),
              qrCodeWidget,
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  "Scan this QR Code to answer ${widget.dataMap["title"]}",
                  style: TextStyle(
                    color: AppTheme.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 0),
                child: Text(
                  "Share this QR Code to your friends so they can answer this quiz! Make sure to scan this QR Code or share it before back to home because this QR Code will not be saved.",
                  style: TextStyle(
                    color: AppTheme.text,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: AnimatedButton(
                    color: AppTheme.secondary,
                    width: size.width * 0.9,
                    child: Text(
                      'Share QR Code',
                      style: TextStyle(
                        color: AppTheme.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed: () async {
                      // final bytes1 = await Utils.capture(key1);
                      // setState(() {
                      //   this.bytes1 = bytes1;
                      // });
                      // await Share.file('Triviazilla QR Code', 'esys.png',
                      //     bytes.buffer.asUint8List(), 'image/png',
                      //     text: 'My optional text.');
                    },
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  child: AnimatedButton(
                    color: AppTheme.white,
                    width: size.width * 0.9,
                    child: Text(
                      'Back to Home',
                      style: TextStyle(
                        color: AppTheme.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed: () {},
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
