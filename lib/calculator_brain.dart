import 'dart:math';

import 'package:bmi_calculator/screens/input_page.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class CalculatorBrain {
  CalculatorBrain({this.height, this.weight});

  final int height;
  final int weight;
  var _bmi;

  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String Getresult() {
    if (_bmi >= 25) {
      return 'overweight';
    } else if (_bmi >= 18.5) {
      return 'Normal';
    } else {
      return 'underweight';
    }
  }
  String GetInterpretation(){
    if (_bmi >= 25) {
      return 'You have higher then normal weight, try exercise more';
    } else if (_bmi >= 18.5) {
      return ' You have normal body weight. Great JOb! ';
    } else {
      return 'You have lower then normal weight, you can eat a bit more';
    }
  }
}