import 'package:flutter/material.dart';

class ReusableContainer extends StatelessWidget {

  final Color couleur;
  final Widget cardChild;
  ReusableContainer({@required this.couleur, this.cardChild});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: cardChild,
      decoration: BoxDecoration(
        color: couleur,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}