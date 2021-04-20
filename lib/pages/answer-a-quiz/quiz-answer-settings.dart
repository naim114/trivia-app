import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:trivia_app/pages/answer-a-quiz/quiz-answer-review.dart';
import 'package:trivia_app/theme/theme.dart';

class QuizAnswerSettings extends StatefulWidget {
  @override
  _QuizAnswerSettingsState createState() => _QuizAnswerSettingsState();
}

class _QuizAnswerSettingsState extends State<QuizAnswerSettings> {
  final GlobalKey _qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  QRViewController? controller;

  @override
  void initState() {
    Fluttertoast.showToast(
        msg:
            "Please enable Camera permission for Triviazilla by go to your phone Application settings");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppTheme.primary,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => QuizAnswerReview(
                    qrResult: "",
                  ),
                ),
              );
            },
            icon: Icon(
              Icons.access_alarm,
              color: Colors.transparent,
            ),
          ),
        ],
        title: Text(
          "Answer a Quiz",
          style: TextStyle(
            color: AppTheme.white,
            fontFamily: "Oxygen",
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Text(
                "Scan Triviazilla QR Code and a quiz will be ready for you to answer.",
                style: TextStyle(
                  color: AppTheme.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ),
            Container(
              height: size.height * .7,
              color: AppTheme.white,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: QRView(
                    key: _qrKey,
                    onQRViewCreated: (QRViewController controller) {
                      this.controller = controller;
                      controller.scannedDataStream.listen((scanData) {
                        print("listening....");
                        result = scanData;
                        print("qr code result: ${scanData.code}");
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) => QuizAnswerReview(
                              qrResult: scanData.code,
                            ),
                          ),
                        );
                        controller.dispose();
                      });
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
