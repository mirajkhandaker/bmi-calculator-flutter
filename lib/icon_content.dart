import 'package:flutter/material.dart';
import 'constance.dart';

class  IconContent extends StatelessWidget {
  
  IconContent({@required this.icon,this.sex});

  final IconData icon;
  final String sex;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
            icon,
            size: 80.0,
          ),
          SizedBox(
            height: 10.0,
          ),
        Text(
          sex,
          style: kLabelStyle
        ),
      ],
    );
  }
}