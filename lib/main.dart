import 'package:flutter/material.dart';

import 'InputHomePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark().copyWith(
        primaryColor: const Color(0XFF0A0E21),
      scaffoldBackgroundColor: const Color(0XFF0A0E21),
      ),
      home: InputHomePage(),
    );
  }
}

