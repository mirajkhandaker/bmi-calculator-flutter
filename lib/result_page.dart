import 'input_page.dart';
import 'package:bmi_calculator/reusable_card.dart';
import 'package:flutter/material.dart';
import 'constance.dart';
import 'bottom_button.dart';

class ResultPage extends StatelessWidget {

ResultPage(
      {@required this.interpretation,
      @required this.bmiResult,
      @required this.resultText});

  final String bmiResult;
  final String resultText;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI-CALCULATOR'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Container(
                child: Text(
                  'Your Result',
                  style: kTitleTextStyle,
                )
              )
               ),
               Expanded(
                 flex: 5,
                 child: ReusableCard(
                   colour: kActiveCardColor,
                   cardChild: Column(
                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                     crossAxisAlignment: CrossAxisAlignment.center,
                     children: <Widget>[
                       Text(
                         resultText.toUpperCase(),
                         style: kResultTextStyle
                       ),
                       Text(
                         bmiResult,
                         style: kBMIResultTextStyle
                       ),
                       Text(
                         interpretation,
                         textAlign: TextAlign.center,
                         style: kBodyTextStyle
                       )
                     ],
                   ),
                   ),
                 ),
                 BottomBotton(
                  buttonText: 'RE-CALCULATE',
                  onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => InputPage())
                        );
                  },
                ),
          ],
        ),
    );
  }
}