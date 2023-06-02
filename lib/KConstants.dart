import 'package:flutter/material.dart';
import 'input_screen.dart';

const KCardClr=Color(0xFF1D1E33);
TextStyle Ktxtstyle(){
  return const TextStyle(
    fontSize: 10.0,
    color: Color(0xFF8D8E98),
  );
}
TextStyle Kbignum(){
  return const TextStyle(
    fontSize: 50.0,
    fontWeight: FontWeight.w900,
  );
}
TextStyle Kbigres(){
  return const TextStyle(
    fontSize: 40.0,
    fontWeight: FontWeight.w600,
  );
}
Container Kbtmbtn(String text){
return Container(
color: btmclr,
width: double.infinity,
height: bottombtnht,
child: Center(
child: Text(
text,
style: Kpnktxt(),
),
),
);
}
SliderThemeData KSlider(var context){
  return SliderTheme.of(context).copyWith(
      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
  overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
  thumbColor: btmclr,
  activeTrackColor: Colors.white,
  overlayColor: overlayclr,
  trackShape: RectangularSliderTrackShape(),
  trackHeight: 1.2);
}
TextStyle Kpnktxt(){
  return TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 30.0,
  );
}