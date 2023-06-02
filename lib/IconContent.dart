import 'package:flutter/material.dart';
import 'package:bmi_calculator/KConstants.dart';
class MaleFemale extends StatelessWidget {
  final IconData icon;
  final String label;
  MaleFemale({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          label,
          style: Ktxtstyle(),
        ),
      ],
    );
  }
}


