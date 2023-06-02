import 'package:flutter/material.dart';
import 'package:bmi_calculator/KConstants.dart';
import 'package:bmi_calculator/card.dart';

class resultScreen extends StatelessWidget {
  const resultScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    String interpret;
    String result;
    Map<String,dynamic>mp = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    var bmi=mp['bmi'];
    interpret=mp['interpret'];
    result=mp['result'];
    var clr=Colors.lightGreen;
    if(result=='Normal'){
      clr=Colors.lightGreen;
    }
    else if(result=='OverWeight'){
      clr=Colors.red;
    }
    else {
      clr=Colors.blue;
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(
        'BMI CALCULATOR',
        ),
      centerTitle: true,
      ),
      body:
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Padding(
            padding: const EdgeInsets.only(top:30.0,left: 20.0),
            child: Text(
              'Your Result',
              style: Kbigres(),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 20.0,bottom: 20.0),

              child: ReusableCard(

                margin: EdgeInsets.symmetric(vertical: 20.0,horizontal: 10.0),
                cardChild: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 60.0),
                  child: Column(

                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        result,
                        style: TextStyle(
                          color: clr,
                          letterSpacing: 2.0,
                        ),
                      ),
                      Text(
                        bmi,
                        style: Kbignum(),
                      ),
                      Text(
                        'Normal BMI Range:',
                        style: Ktxtstyle().copyWith(
                          fontSize: 16.0,
                        ),
                      ),
                      Text(
                        '18.5 - 25 kg/m2',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: Text(
                          interpret,
                          textAlign: TextAlign.center,
                          style: TextStyle(

                            fontSize: 20.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
              child: Kbtmbtn('RE-CALCULATE')),
        ],
      ),
    );
  }
}
