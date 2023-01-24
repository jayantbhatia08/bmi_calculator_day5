import 'package:flutter/material.dart';
import 'package:bmi_calculator_day5/Constants.dart';
import 'package:bmi_calculator_day5/ResultsPage.dart';

class BottomButton extends StatelessWidget {
  BottomButton({required this.buttonTitle,required this.onTap});

  final String buttonTitle;
  final  VoidCallback onTap;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(child: Text(buttonTitle, style: LargeNumberTextStyle,)),
        color: const Color(0xFFEB1555),
        margin: EdgeInsets.only(top: 18.0),
        width: double.infinity,
        height: bottomHeight,
      ),
    );
  }
}