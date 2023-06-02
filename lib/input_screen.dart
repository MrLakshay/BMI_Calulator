import 'calculatorBrain.dart';
import 'package:flutter/material.dart';
import 'card.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'IconContent.dart';
import 'package:bmi_calculator/KConstants.dart';
import 'screens/resultScreen.dart';
import 'main.dart';
const bottombtnht=80.0;
enum Gender{
  male,female
}
const btmclr=Color(0xFFEB1555);
const overlayclr=Color(0x29EB1555);
const inactiveCardClr=Color(0xFF111328);
const activeCardClr=Color(0xFF1D1E33);
const Kinactivecolor=Color(0xFF8D8E98);
Color Malecolor = inactiveCardClr;
Color Femalecolor = inactiveCardClr;
class input_screen extends StatefulWidget {


  @override
  State<input_screen> createState() => _input_screenState();
}

class _input_screenState extends State<input_screen> {
  Gender selectedGender=Gender.male;
  int height=180;
  int weight=60;
  int age=20;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'BMI CALCULATOR',
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: (){
                    setState(() {
                      selectedGender=Gender.male;
                    });
                  },
                  child: ReusableCard(
                    colour: Malecolor= selectedGender==Gender.male?activeCardClr:inactiveCardClr,

                    cardChild: MaleFemale(label: 'MALE',icon: FontAwesomeIcons.mars,),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: (){
                    setState(() {
                      selectedGender=Gender.female;
                    });
                  },
                  child: ReusableCard(
                    colour: Femalecolor= selectedGender==Gender.female?activeCardClr:inactiveCardClr,
                    cardChild: MaleFemale(label: 'FEMALE',icon: FontAwesomeIcons.venus,),
                  ),
                ),
              ),
            ],
          ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'HEIGHT',
                          style: Ktxtstyle(),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(height.toString(),
                            style: Kbignum(),
                            ),
                            Text('cm',
                              style: Ktxtstyle(),
                            ),
                            ],
                        ),
                        SliderTheme(
                          data: KSlider(context),
                          child: Slider(value: height.toDouble(),
                            min: 120.0,
                            max: 220.0,
                            inactiveColor: Kinactivecolor,
                            
                            onChanged:(double newValue){
                              setState(() {
                                height=newValue.round();
                              });
                            },),
                        ),
                      ],
                    )
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'WEIGHT',
                          style: Ktxtstyle(),
                        ),
                        Text(
                          weight.toString(),
                          style: Kbignum(),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            KPlusMinus(icon: Icons.remove,
                                onPress: (){
                                  setState(() {
                                    weight--;
                                  });
                                }
                            ),
                            KPlusMinus(
                                icon: Icons.add,
                                onPress: () {
                                  setState(() {
                                    weight++;
                                  });
                                }
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'AGE',
                          style: Ktxtstyle(),
                        ),
                        Text(
                          age.toString(),
                          style: Kbignum(),
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // KPlusMinus(Icons.remove),
                            // KPlusMinus(Icons.add),
                            KPlusMinus(icon: Icons.remove,
                                onPress: (){
                                  setState(() {
                                    age--;
                                  });
                                }
                            ),
                            KPlusMinus(
                                icon: Icons.add,
                                onPress: () {
                                  setState(() {
                                    age++;
                                  });
                                }
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: (){
              var calc_brain = CalculatorBrain(weight: weight,height: height);
              calc_brain.CalculateBMI();
              String bmi=calc_brain.CalculateBMI();
              String result=calc_brain.GetResult();
              String interpret=calc_brain.getInterpretation();
              Navigator.pushNamed(context,'/screens/resultScreen',arguments: {
                'bmi': bmi,
                'result': result,
                'interpret': interpret,
              });

            },
            child: Kbtmbtn('CALCULATE'),
          )
        ],
      ),
    );
  }


}
class KPlusMinus extends StatelessWidget {
  final VoidCallback onPress;
  IconData icon;
  // KPlusMinus({required this.icon, required this.onPress});
  KPlusMinus({required this.icon,required this.onPress});

  @override
  Widget build(BuildContext context) {
      return ElevatedButton(
        onPressed: onPress ,
        // onPressed: onPress(),
        child: Icon(icon),
        style: ElevatedButton.styleFrom(
          shape: CircleBorder(),
          padding: EdgeInsets.all(12.0),
          backgroundColor: Color(0xFF4C4F5E),
        ),
      );
    }
}



