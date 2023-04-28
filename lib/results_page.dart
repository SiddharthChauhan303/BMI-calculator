import 'package:bmi_calculator/main.dart';
import 'package:bmi_calculator/reusable_cards.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/input_page.dart';
import 'package:bmi_calculator/reusable_cards.dart';

class resultsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('BMI CALCULATOR')),
      ),
      body:Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              child:Text("Your Result",style: label3,),
            ),
          ),
          Expanded(
            flex: 5,
            child:ReusableCard(
              colour: Palette.lol[100],
              CardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Normal",
                    style: label4,
                  ),
                  Text(
                    '18.3',
                    style:label5,
                  ),
                  Text(
                    'Your BMI is low. Eat more.',
                    textAlign: TextAlign.center,
                    style:label6,
                  ),
                  GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                color: Palette.lol[200],
                margin: EdgeInsets.only(top: 10),
                width: double.infinity,
                height: bottomContHeight,
                padding: EdgeInsets.only(bottom: 20),
                child: Center(
                    child: Text(
                  "RE-CALCULATE",
                  style: lable2,
                )),
              ),
            )
                ],
              ),
              
              )
          )
        ],
        )
    );
  }
}
