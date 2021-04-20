import 'dart:convert';
import 'dart:typed_data';

import 'package:trivia_app/theme/theme.dart';

import 'package:animated_button/animated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:screenshot/screenshot.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';

class QuizCreateFinalize extends StatefulWidget {
  final Map<String, dynamic> dataMap;

  const QuizCreateFinalize({
    Key? key,
    required this.dataMap,
  }) : super(key: key);

  @override
  _QuizCreateFinalizeState createState() => _QuizCreateFinalizeState();
}

class _QuizCreateFinalizeState extends State<QuizCreateFinalize> {
  ScreenshotController screenshotController = ScreenshotController();
  Uint8List? _imageFile;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    String jsonDataMap = jsonEncode(widget.dataMap);
    print("xxx xxx xxx xxx JSON DATA MAP xxx xxx xxx xxx");
    print(jsonDataMap);
    print("xxx xxx xxx xxx JSON DATA MAP xxx xxx xxx xxx");

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
        centerTitle: true,
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
              Screenshot(
                controller: screenshotController,
                child: qrCodeWidget,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  "Scan this QR Code to ansswer ${widget.dataMap["title"]}",
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
                  "Share this QR Code to your friends so they can answer this quiz! Make sure to scan this QR Code or save to gallery before back to home because this QR Code will not be saved.",
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
                      'Save to Gallery',
                      style: TextStyle(
                        color: AppTheme.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed: () async {
                      // print("_imageFile before: ${_imageFile.toString()}");
                      screenshotController.capture().then((image) async {
                        setState(() {
                          _imageFile = image;
                        });
                        // print("setState successful");
                        // print("_imageFile after: $_imageFile");
                        // print("image: $image");

                        // var permissionReq =
                        //     await Permission.mediaLibrary.request().isGranted;
                        // print("permissionReq : $permissionReq");
                        // var status = await Permission.storage.status;
                        // print("permission : $status");

                        final result = await ImageGallerySaver.saveImage(image!,
                            name:
                                "${widget.dataMap["title"]}-Triviazilla-QR-Code");
                        print("result: $result");
                      }).catchError((onError) {
                        print("screenController error: $onError");
                        Fluttertoast.showToast(msg: "Error: $onError");
                      });
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
