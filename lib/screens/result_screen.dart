import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:flutter/material.dart';

import '../components/bottomButton.dart';
import '../calculate_bmi.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({Key? key, required this.calculatorBrain})
      : super(key: key);
  final CalculatorBrain calculatorBrain;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea (
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(20.0, 10.0, 0.0, 0.0),
              child: Text(
                "Your Result",
                style: kTitleStyle,
                textAlign: TextAlign.start,
              ),
            ),
            ReusableCard(
              cardColor: kActiveCardColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    calculatorBrain.getResult(),
                    style: kResultStyle,
                    textAlign: TextAlign.center,
                  ),
                  Text(calculatorBrain.calculateBMI(),
                      style: kResultNumberStyle, textAlign: TextAlign.center),
                  Text(
                    calculatorBrain.getInterpretation(),
                    style: kInterpretationStyle,
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
            BottomButton(
              text: "RE-CALCULATE",
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
