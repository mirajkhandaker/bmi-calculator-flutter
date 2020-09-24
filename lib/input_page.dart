import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reusable_card.dart';
import 'icon_content.dart';
import 'constance.dart';
import 'result_page.dart';
import 'bottom_button.dart';
import 'calculator_brain.dart';

enum Gender {
male,
female
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  Gender selectedGender;
  int height = 150;
  int weight = 60;
  int age = 20;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child:Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    onPress: (){
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                  colour: selectedGender == Gender.male ? kActiveCardColor:kInActiveCardColor,
                  cardChild: IconContent(
                    icon: FontAwesomeIcons.mars,
                    sex: 'Male',
                  ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPress: (){
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                  colour: selectedGender == Gender.female ? kActiveCardColor:kInActiveCardColor,
                  cardChild: IconContent(
                    icon: FontAwesomeIcons.venus,
                    sex: 'Female',
                  ),
                  )
                )
              ],
            ),
          ),
           Expanded(
            child:Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    colour: kReusableCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Height',
                          style: kLabelStyle
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                           crossAxisAlignment: CrossAxisAlignment.baseline,
                           textBaseline: TextBaseline.alphabetic,
                          children: <Widget>[
                            Text(
                              height.toString(),
                              style: kNumberTextStyle,
                            ),
                            Text(
                              'cm',
                              style: kLabelStyle,
                            ),
                          ],
                        ),
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            activeTrackColor:  Color(0xFFEB1555),
                            inactiveTrackColor: Color(0xFF8D8E98),
                            thumbColor: Color(0XFFEB1555),
                            overlayColor: Color(0x29EB1555),
                            thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                            overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0)
                          ), 
                            child: Slider(
                            value: height.toDouble(),
                            min: 100,
                            max: 300,
                            onChanged: (double sliderValue){
                              setState(() {
                                height = sliderValue.round();
                            });
                            },
                          ),
                        ),
                      ],
                    ),
                    )
                ),
              ],
            ),
          ),
           Expanded(
            child:Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    colour: kReusableCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'WEIGHT',
                          style: kLabelStyle
                        ),
                        Text(
                          weight.toString(),
                          style: kNumberTextStyle
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundActionButton(
                              icon: FontAwesomeIcons.minus,
                              onPress: (){
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                              SizedBox(
                                width:10.0
                              ),
                            RoundActionButton(
                              icon: FontAwesomeIcons.plus,
                              onPress: (){
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                    )
                ),
                Expanded(
                  child: ReusableCard(
                    colour: kReusableCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Age',
                          style: kLabelStyle
                        ),
                        Text(
                          age.toString(),
                          style: kNumberTextStyle
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundActionButton(
                              icon: FontAwesomeIcons.minus,
                              onPress: (){
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                              SizedBox(
                                width:10.0
                              ),
                            RoundActionButton(
                              icon: FontAwesomeIcons.plus,
                              onPress: (){
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                    )
                )
              ],
            ),
          ),
          BottomBotton(
            buttonText: 'CALCULATE',
            onTap: (){
              CalculatorBrain calc = CalculatorBrain(height: height,weight: weight);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ResultPage(
                    bmiResult: calc.calculateBMI(),
                    interpretation: calc.getInterpretation(),
                    resultText: calc.getResult(),
                  ))
                  );
            },
          ),
        ],
      ),
    );
  }
}

class RoundActionButton extends StatelessWidget {
RoundActionButton({this.icon,this.onPress});
  final IconData icon;
  final Function onPress;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPress,
      child: Icon(icon),
      fillColor: Color(0xFF4C4F5E),
      shape: CircleBorder(),
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
    );
  }
}



