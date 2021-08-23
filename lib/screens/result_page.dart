import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/conponents/reusable_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../conponents/bottombutton.dart';


class result_page extends StatelessWidget {
  result_page({this.bmiResult, this.resultText, this.interpretation});

  final String bmiResult;
  final String resultText;
  final String interpretation;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('BMI calculator')),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
              child: Container(
                padding: EdgeInsets.all(15.0),
                alignment: Alignment.bottomLeft,
                child: Text(
                  'Your Result',
                  style: KTitleTextStyle,
                ),
              )),
          Expanded(
            flex: 5,
            child: Reuseblecard(
              colour: KActiveCardColor,
              CardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    resultText,
                    style: KResultTextStyle,
                  ),
                  Text(
                    bmiResult,
                    style: KBmiTextStyle,
                  ),
                  Text(
                    interpretation,
                    style: KBodyTextStyle,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          BottomButton(
            ontap: () {
              Navigator.pop(context);
            },
            BottonTitle: 'RE-CALCULATE',
          )
        ],
      ),
    );
  }
}
