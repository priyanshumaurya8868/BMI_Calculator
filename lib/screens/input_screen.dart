import 'package:bmi_calculator/calculate_bmi.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../components/bottomButton.dart';
import '../constants.dart';
import '../components/icon_content.dart';
import 'result_screen.dart';
import '../components/reusable_card.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? selectedGender;
  int height = 150;
  int weight = 42;
  int age = 21;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                ReusableCard(
                  cardColor: selectedGender == Gender.male
                      ? kActiveCardColor
                      : kInactiveCardColor,
                  onTap: () {
                    setState(() {
                      selectedGender = Gender.male;
                    });
                  },
                  child: IconContent(
                      icon: FontAwesomeIcons.mars,
                      labelText: "MALE",
                      iconColor: selectedGender == Gender.male
                          ? Colors.white
                          : kInactiveWhite),
                ),
                ReusableCard(
                  onTap: () {
                    setState(() {
                      selectedGender = Gender.female;
                    });
                  },
                  cardColor: selectedGender == Gender.female
                      ? kActiveCardColor
                      : kInactiveCardColor,
                  child: IconContent(
                      icon: FontAwesomeIcons.venus,
                      labelText: "FEMALE",
                      iconColor: selectedGender == Gender.female
                          ? Colors.white
                          : kInactiveWhite),
                )
              ],
            ),
          ),
          ReusableCard(
            cardColor: kActiveCardColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "HEIGHT",
                  style: kLabelTextStyle,
                ),
                SizedBox(height: 15.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(height.toString(), style: kNumberTextStyle),
                    Text("cm", style: kLabelTextStyle)
                  ],
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    activeTrackColor: Colors.white,
                    inactiveTrackColor: Colors.white24,
                    thumbColor: kSecondaryColor,
                    overlayColor: kSecondaryColor.withOpacity(0.5),
                    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                    overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
                  ),
                  child: Slider(
                      value: height.toDouble(),
                      min: 120.0,
                      max: 220.0,
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      }),
                )
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                ReusableCard(
                  cardColor: kActiveCardColor,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("WEIGHT", style: kLabelTextStyle),
                      SizedBox(height: 15.0),
                      Text(weight.toString(), style: kNumberTextStyle),
                      SizedBox(height: 15.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundButton(
                            child: Icon(FontAwesomeIcons.plus),
                            onTap: () {
                              setState(() {
                                weight++;
                              });
                            },
                          ),
                          SizedBox(width: 15.0),
                          RoundButton(
                            child: Icon(FontAwesomeIcons.minus),
                            onTap: () {
                              setState(() {
                                weight--;
                              });
                            },
                          )
                        ],
                      )
                    ],
                  ),
                ),
                ReusableCard(
                  cardColor: kActiveCardColor,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("AGE", style: kLabelTextStyle),
                      SizedBox(height: 15.0),
                      Text(age.toString(), style: kNumberTextStyle),
                      SizedBox(height: 15.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundButton(
                            child: Icon(FontAwesomeIcons.plus),
                            onTap: () {
                              setState(() {
                                age++;
                              });
                            },
                          ),
                          SizedBox(width: 15.0),
                          RoundButton(
                            child: Icon(FontAwesomeIcons.minus),
                            onTap: () {
                              setState(() {
                                age--;
                              });
                            },
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
            text: "CALCULATE",
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultScreen(
                    calculatorBrain:
                        CalculatorBrain(height: height, weight: weight),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class RoundButton extends StatelessWidget {
  const RoundButton({Key? key, required this.child, required this.onTap})
      : super(key: key);
  final Widget child;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      shape: CircleBorder(),
      onPressed: onTap,
      fillColor: kFabColor,
      child: child,
      elevation: 0.0,
      constraints: const BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
    );
  }
}
