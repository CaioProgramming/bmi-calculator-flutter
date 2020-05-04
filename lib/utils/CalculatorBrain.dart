import 'dart:math';

import 'package:bmi_calculator/Person.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CalculatorBrain{
  Person person;
  CalculatorBrain({this.person}){
    calculateBMI();
  }
  String resultType,resultMessage,bmResult;
  double _bmi;
  Color bmiColor;

  void calculateBMI(){
    this._bmi = person.weight / pow(person.height/100, 2);
    bmResult = this._bmi.toStringAsFixed(1);
    resultType = _bmiType();
    resultMessage = _bmiMessage();
    bmiColor = _bmiColor();
  }

  String _bmiType(){
    if(this._bmi >= 25){
        return 'Overwieght';
    }else if(_bmi > 18.5) {
      return 'Normal';
    } else{
      return 'UnderWeight';
    }
  }
  String _bmiMessage(){
    if(this._bmi >= 25){
      return 'You\'re overweight you need to make more healthy habits';
    }else if(_bmi > 18.5) {
      return 'You\'re healthy, good Job! Keep in that way!';
    } else{
      return 'You\'re underweight, you should eat more!';
    }
  }
  Color _bmiColor(){
    if(this._bmi >= 25){
      return Colors.red;
    }else if(_bmi > 18.5) {
      return Colors.green;
    } else{
      return Colors.yellow;
    }
  }

}