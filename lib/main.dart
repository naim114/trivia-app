import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:trivia_app/pages/login.dart';
import 'package:trivia_app/pages/onboarding.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as pathProvider;

// void main() {
//   runApp(MyApp());
// }

Future<void> main() async {
  Directory directory = await pathProvider.getApplicationDocumentsDirectory();
  Hive.init(directory.path);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Triviazilla - Q&A App',
      theme: ThemeData(
        fontFamily: "Oxygen",
      ),
      // home: MyHomePage(title: 'Flutter Demo Home Page'),
      initialRoute: '/onboarding',
      routes: {
        '/login': (context) => Login(),
        '/onboarding': (context) => Onboarding(),
      },
    );
  }
}
