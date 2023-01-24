import 'package:flutter/material.dart';
import 'package:bmi_calculator_day5/Constants.dart';
import 'package:bmi_calculator_day5/ReuseCard.dart';
import 'package:bmi_calculator_day5/BottomButton.dart';
class ResultsPage extends StatelessWidget {
   ResultsPage({required this.textResult, required this.bmiResult, required this.resultText});

  final String bmiResult;
  final String resultText;
  final String textResult;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('BMI CALCULATOR')),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: const Text(
                'Your Result',
                style: TitleTextStyle,
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: ReuseAbleCard(
              colour: activeCardColour,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                     resultText.toUpperCase(),
                    style: resultTextStyle,
                  ),
                  Text(
                     bmiResult,
                    style: BMITextStyle,
                  ),
                  Text(
                    textResult,
                    textAlign: TextAlign.center,
                    style: BodyTextStyle,
                  ),
                ],
              ),
            ),
          ),
          BottomButton(
            buttonTitle: 'RE-CALCULATE',
            onTap: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
  }