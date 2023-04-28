import 'package:bmi_calculator/main.dart';
import 'package:bmi_calculator/results_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/reusable_cards.dart';
import 'package:bmi_calculator/results_page.dart';

const lable2 = TextStyle(
  fontSize: 25,
  fontWeight: FontWeight.bold,
);

const label = TextStyle(
  fontSize: 18,
  color: Colors.white,
);

const label4 = TextStyle(
  fontSize: 22,
  color: Colors.greenAccent,
  fontWeight: FontWeight.bold,
);
const label5 = TextStyle(
  fontSize: 100,
  fontWeight: FontWeight.bold,
);
const label6 = TextStyle(fontSize: 22);
const label3 = TextStyle(
  fontSize: 50,
  fontWeight: FontWeight.bold,
);
const numbers = TextStyle(
  fontSize: 50,
  fontWeight: FontWeight.w900,
);
const bottomContHeight = 80.0;
const Color1 = Palette.lol;
const Color2 = Palette.lol;

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender gend;
  int age = 18;
  int height = 180;
  int weight = 60;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text('BMI CALCULATOR')),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                    child: ReusableCard(
                  func: () {
                    setState(() {
                      gend = Gender.male;
                    });
                  },
                  colour:
                      gend == Gender.male ? Palette.lol[100] : Palette.lol[300],
                  CardChild: ReusableCard2(
                    w1: FontAwesomeIcons.mars,
                    w2: "MALE",
                  ),
                )),
                Expanded(
                    child: ReusableCard(
                  func: () {
                    setState(() {
                      gend = Gender.female;
                    });
                  },
                  colour: gend == Gender.female
                      ? Palette.lol[100]
                      : Palette.lol[300],
                  CardChild: ReusableCard2(
                    w1: FontAwesomeIcons.venus,
                    w2: "FEMALE",
                  ),
                )),
              ],
            ),
            Expanded(
                child: ReusableCard(
              colour: Palette.lol[100],
              CardChild: Column(children: <Widget>[
                Text(
                  "HEIGHT",
                  style: label,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: <Widget>[
                    Text(
                      height.toString(),
                      style: numbers,
                    ),
                    Text(
                      "cm",
                      style: label,
                    )
                  ],
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15),
                    overlayShape: RoundSliderOverlayShape(overlayRadius: 25),
                    thumbColor: Palette.lol[200],
                    activeTrackColor: Colors.white,
                    overlayColor: Palette.lol[500],
                    inactiveTrackColor: Palette.lol[400],
                  ),
                  child: Slider(
                    value: height.toDouble(),
                    min: 120,
                    max: 220,
                    onChanged: (double newval) {
                      setState(() {
                        height = newval.round();
                      });
                    },
                  ),
                )
              ]),
            )),
            Row(
              children: <Widget>[
                Expanded(
                    child: ReusableCard(
                  colour: Palette.lol[100],
                  CardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "WEIGHT",
                          style: label,
                        ),
                        Text(
                          weight.toString(),
                          style: numbers,
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                func: () {
                                  setState(() {
                                    if (weight > 0)
                                      weight--;
                                    else
                                      weight = 0;
                                  });
                                },
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              RoundIconButton(
                                  icon: FontAwesomeIcons.plus,
                                  func: () {
                                    setState(() {
                                      if (weight < 300)
                                        weight++;
                                      else
                                        weight = 300;
                                    });
                                  }),
                            ])
                      ]),
                )),
                Expanded(
                    child: ReusableCard(
                  colour: Palette.lol[100],
                  CardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "AGE",
                          style: label,
                        ),
                        Text(
                          age.toString(),
                          style: numbers,
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                func: () {
                                  setState(() {
                                    if (age > 0)
                                      age--;
                                    else
                                      age = 0;
                                  });
                                },
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              RoundIconButton(
                                  icon: FontAwesomeIcons.plus,
                                  func: () {
                                    setState(() {
                                      if (age < 100)
                                        age++;
                                      else
                                        age = 100;
                                    });
                                  }),
                            ])
                      ]),
                ))
              ],
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => resultsPage()));
              },
              child: Container(
                color: Palette.lol[200],
                margin: EdgeInsets.only(top: 10),
                width: double.infinity,
                height: bottomContHeight,
                padding: EdgeInsets.only(bottom: 20),
                child: Center(
                    child: Text(
                  "CALCULATE",
                  style: lable2,
                )),
              ),
            )
          ],
        ));
  }
}

class RoundIconButton extends StatelessWidget {
  RoundIconButton({this.icon, this.func});
  final IconData icon;
  final Function func;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      onPressed: func,
      elevation: 0,
      constraints: BoxConstraints.tightFor(
        width: 56,
        height: 56,
      ),
      shape: CircleBorder(),
      fillColor: Palette.lol[400],
    );
  }
}
