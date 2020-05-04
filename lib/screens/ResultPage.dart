import 'package:bmi_calculator/components/BMICard.dart';
import 'package:bmi_calculator/components/BottomButton.dart';
import 'package:bmi_calculator/utils/CalculatorBrain.dart';
import 'package:bmi_calculator/utils/Helper.dart';
import 'package:bmi_calculator/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Person.dart';

class ResultPage extends StatelessWidget {
  final Color cardColor;
  final Person person;
  CalculatorBrain brain;
  ResultPage(this.cardColor,this.person){
    brain = CalculatorBrain(person: person);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'BMI Calculator',
          ),
          elevation: 0,
        ),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Your Result',
                      style: knumberTextStyle,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 5,
                child: BMICard(
                  color: cardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        '${brain.resultType}'.toUpperCase(),
                        style: TextStyle(
                            color: brain.bmiColor,
                            fontSize: 22,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '${brain.bmResult}',
                        style: knumberTextStyle,
                      ),
                      Text(
                        '${brain.resultMessage}',
                        style: Helper().labelTextStyle(Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
              BottomButton(
                title: 'Recalculate',
                visible: true,
                onTap: () {
                  Navigator.pop(context);
                },
              )
            ],
          ),
        ));
  }
}
