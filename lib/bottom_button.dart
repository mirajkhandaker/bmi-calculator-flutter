import 'package:flutter/material.dart';
import 'constance.dart';

class BottomBotton extends StatelessWidget {

  BottomBotton({@required this.buttonText, @required this.onTap});

  final Function onTap;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
            onTap: onTap,
              child: Container(
              child:Center(
                child:Text(buttonText,
                  style:kLargeButtonStyle,
                ),
              ),
              // padding: EdgeInsets.only(bottom:20),
              color: kBottomContainerColor,
              width: double.infinity,
              height: kBottomBContainerHeight,
              margin: EdgeInsets.only(top:10.0),
            ),
          );
  }
}