import 'package:flutter/material.dart';
import 'screen/mainpage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.blueAccent,
        scaffoldBackgroundColor: Color(0xFF00142F),
        textTheme: TextTheme(
          bodyText2: TextStyle(
            color: Colors.black
          )
        )
      ),
      home: Scaffold(
        body: MainPage(),
      ),
    );
  }
}
