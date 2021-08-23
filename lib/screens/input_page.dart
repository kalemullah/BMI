import 'package:bmi_calculator/screens/result_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../conponents/bottombutton.dart';
import '../constants.dart';
import '../conponents/icons_content.dart';
import '../conponents/reusable_card.dart';
import 'result_page.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/calculator_brain.dart';

int height = 180;
int weight = 60;
int age = 18;
enum Gender { male, female }

class InputPage extends StatefulWidget {
//  const InputPage({Key? key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI Calculator"),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Reuseblecard(
                    onpress: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    colour: selectedGender == Gender.male
                        ? KActiveCardColor
                        : KInActiveCardColor,
                    CardChild: (IconContent(
                      icon: FontAwesomeIcons.mars,
                      label: 'Male',
                    )),
                  ),
                ),
                Expanded(
                  child: Reuseblecard(
                    onpress: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    colour: selectedGender == Gender.female
                        ? KActiveCardColor
                        : KInActiveCardColor,
                    CardChild: (IconContent(
                      icon: FontAwesomeIcons.venus,
                      label: 'Female',
                    )),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Reuseblecard(
              colour: KActiveCardColor,
              CardChild: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Height',
                    style: KLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toString(),
                        style: KNumberTextStyle,
                      ),
                      Text(
                        'cm',
                        style: KLabelTextStyle,
                      )
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: Color(0xff8d8e98),
                      thumbColor: Color(0xffEB1555),
                      overlayColor: Color(0x29EB1555),
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 10.0),
                      overlayShape:
                          RoundSliderOverlayShape(overlayRadius: 25.0),
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
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Reuseblecard(
                    colour: KActiveCardColor,
                    CardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Weight',
                          style: KLabelTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: KNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundedIconButton(
                              icon: FontAwesomeIcons.minus,
                              onpressed: () {
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                            SizedBox(width: 10.0),
                            RoundedIconButton(
                              icon: FontAwesomeIcons.plus,
                              onpressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Reuseblecard(
                    colour: KActiveCardColor,
                    CardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Age',
                          style: KLabelTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: KNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundedAgeButton(
                              icon: FontAwesomeIcons.minus,
                              onpressed: () {
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundedAgeButton(
                              icon: FontAwesomeIcons.plus,
                              onpressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
            ontap: () {
              CalculatorBrain calc =
                  CalculatorBrain(height: height, weight: weight);
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return result_page(
                  bmiResult: calc.calculateBMI(),
                  resultText: calc.Getresult(),
                  interpretation: calc.GetInterpretation(),
                );
              }));
            },
            BottonTitle: 'CALCULATE',
          )
        ],
      ),
    );
  }
}

class RoundedIconButton extends StatelessWidget {
  RoundedIconButton({this.icon, this.onpressed});

  final IconData icon;
  final Function onpressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      constraints: BoxConstraints(
        minHeight: 56.0,
        minWidth: 56.0,
      ),
      elevation: 6.0,
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
      onPressed: onpressed,
    );
  }
}

class RoundedAgeButton extends StatelessWidget {
  RoundedAgeButton({this.icon, this.onpressed});

  final IconData icon;
  final Function onpressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      constraints: BoxConstraints(
        minHeight: 56.0,
        minWidth: 56.0,
      ),
      elevation: 6.0,
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
      onPressed: onpressed,
    );
  }
}
