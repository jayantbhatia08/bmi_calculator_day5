
import 'package:flutter/material.dart';
import 'package:bmi_calculator_day5/Constants.dart';
class ReuseIcon extends StatelessWidget {
  ReuseIcon({ required this.icon, required this.text});
  final IconData icon;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              icon,
              size: 70.0,
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(text, style: labelTextStyle),
          ]
      ),
    );
  }
}