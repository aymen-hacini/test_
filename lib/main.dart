import 'package:flutter/material.dart';
import 'package:test_/homepage/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme:
          ThemeData(
            fontFamily: 'Ubuntu',
            appBarTheme: const AppBarTheme(color: Color(0xff277bc0))),
      debugShowCheckedModeBanner: false,
      title: 'Test',
      home: const Homepage(),
    );
  }
}
