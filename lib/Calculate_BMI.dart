import 'dart:math';
import 'package:bmi_calculator_day5/InputHomePage.dart';

class CalculatorBrain {
  CalculatorBrain({required this.height, required this.weight});

   final int height;
   final int weight;

  double bmi=0;

  String calculateBMI() {
    bmi = weight / pow(height / 100, 2);
    return bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (bmi >= 25) {
      return 'OverWeight';
    } else if (bmi > 18.5) {
      return 'Normal';
    } else {
      return 'UnderWeight';
    }
  }

  String gettextResult() {
    if (bmi >= 25) {
      return 'Try to exercise more, As Your BMI is greater than Normal.';
    } else if (bmi >= 18.5) {
      return 'You have a normal body weight. Good job!';
    } else {
      return 'You can eat a bit more, As Your MBI is lower than Normal.';
    }
  }
}