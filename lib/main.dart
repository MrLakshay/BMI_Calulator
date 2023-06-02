import 'package:bmi_calculator/screens/resultScreen.dart';
import 'package:flutter/material.dart';
import 'input_screen.dart';
void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    routes: {
      '/screens/resultScreen': (context) => resultScreen(),
      '/input_screen': (context) => input_screen(),
    },
    theme: ThemeData.dark().copyWith(
      scaffoldBackgroundColor: Color(0xFF0A0E21),
      appBarTheme: AppBarTheme(
        color: Color(0xFF0A0E21),
      )
    ),
    home: input_screen(),
  ));
}



