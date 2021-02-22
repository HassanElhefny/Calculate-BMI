import 'dart:math';

import 'package:flutter/cupertino.dart';

class CalculateBMI {
  final height;
  final weight;
  double _result;

  CalculateBMI({@required this.height, @required this.weight});

  String calculateBMI() {
    _result = weight / pow(height / 100, 2);
    return _result.toStringAsFixed(1);
  }

  String getResult() {
    if (_result >= 25) {
      return "OverWeight";
    } else if (_result > 18.5) {
      return 'NORMAL';
    } else {
      return 'Under Weight';
    }
  }

  String getInterpertation() {
    if (_result >= 25) {
      return 'you have a higher than normal body weight. try to exercise more.';
    } else if (_result > 18.5) {
      return 'you have a normal body weight. Good Job';
    } else {
      return 'You have a lower than normal body weight. You can eat a bit more';
    }
  }
}
