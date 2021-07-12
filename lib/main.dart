import 'package:flutter/material.dart';
import 'InputPage.dart';
import 'Results_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        // ThemeData.dark().copyWith( do same as below with basic implementation of dark theme)
        primaryColor: Color(0xFF0A0E21),
        scaffoldBackgroundColor: Color(0xFF0A0E21),
        accentColor: Colors.green,
        textTheme: TextTheme(
          bodyText2: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      home: InputPage(),
    );
  }
}

/*
initialRoute: '/',
      routes: {
        '/': (context) => InputPage(),
        '/result': (context) => Results(),
      },
 */
