import 'package:flutter/material.dart';
import 'constants-design.dart';


class GenderCreator extends StatelessWidget {

  GenderCreator({this.icon,this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: 80,
          color: Colors.white,
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          label,
          style: textDesign,
        ),
      ],
    );
  }
}