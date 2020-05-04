import 'package:bmi_calculator/Person.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'screens/InputPage.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  final maincolor = Colors.grey.shade900;
  final Person person = Person();

  @override
  Widget build(BuildContext context) {
   /* SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: maincolor,
      systemNavigationBarColor: Colors.red.shade800
    ));*/

    return MaterialApp(
      theme: ThemeData.dark().copyWith(
          accentColor: Colors.redAccent,
          primaryColor: maincolor,
          scaffoldBackgroundColor: maincolor),
      home: InputPage(maincolor,person),
    );
  }
}

