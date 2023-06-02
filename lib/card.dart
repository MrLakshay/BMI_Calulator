import 'package:flutter/material.dart';
import 'KConstants.dart';
class ReusableCard extends StatelessWidget {
  late Color colour;
  late Widget cardChild;
  var margin=EdgeInsets.all(8.0);
  ReusableCard({this.colour = KCardClr, this.cardChild = const Text(''),this.margin=const EdgeInsets.all(8.0)});

  @override
  Widget build(BuildContext context) {
    return Container(

      width: double.infinity,
      margin: margin,
      decoration: BoxDecoration(
        color: colour,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: cardChild,
    );
  }
}