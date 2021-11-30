import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Calculate {
  Calculate({required this.height, required this.weight});

  final int height;
  final int weight;

  double? _bmi;

  String calcBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi!.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi! > 30) {
      return 'Obesity';
    } else if (_bmi! <= 30 && _bmi! >= 25) {
      return 'Overweight';
    } else if (_bmi! > 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String getInterpret() {
    if (_bmi! >= 25) {
      return 'You have a higher than normal body weight. Try to exercise more.';
    } else if (_bmi! > 18.5) {
      return 'You have a normal body weight. Good job!';
    } else {
      return 'You have a lower than normal body weight. You can eat a bit more.';
    }
  }

 Color? getColor() {
    if (_bmi! > 40) {
      return const Color(0xFF660000);
    } else if (_bmi! <= 40 && _bmi! > 35) {
      return const Color(0xFFB61111);
    } else if (_bmi! <= 35 && _bmi! > 30) {
      return const Color(0xFFEC5050);
    } else if (_bmi! <= 30 && _bmi! > 25) {
      return  Colors.yellow;
    } else if (_bmi! <= 25 && _bmi! > 18.5) {
      return Colors.green;
    } else {
      return Colors.red[800];
    }
  }
}
