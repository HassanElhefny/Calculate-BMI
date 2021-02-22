import 'package:calculate_bmi/BottomButton.dart';
import 'package:calculate_bmi/CalculateBMI.dart';
import 'package:calculate_bmi/ResultPage.dart';
import 'package:calculate_bmi/RoundedIconButton.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'Constan.dart';
import 'ContainerContent.dart';
import 'ReUsableCard.dart';

int weight = 40;
int age = 20;
int height = 180;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: Color(0xff0A0E21),
          accentColor: Colors.purple,
          primaryColor: Color(0xff0A0E21)),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Gender selectedGender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI CALCULATE"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                  child: ReUsableCard(
                    child: ContainerContent(
                      iconData: FontAwesomeIcons.mars,
                      title: "MALE",
                    ),
                    color:
                    selectedGender == Gender.MALE ? activeColor : inActiveColor,
                    work: () {
                      setState(() {
                        selectedGender = Gender.MALE;
                      });
                    },
                  )),
              Expanded(
                  child: ReUsableCard(
                    color: selectedGender == Gender.FEMALE
                        ? activeColor
                        : inActiveColor,
                    child: ContainerContent(
                      iconData: FontAwesomeIcons.venus,
                      title: "FEMALE",
                    ),
                    work: () {
                      setState(() {
                        selectedGender = Gender.FEMALE;
                      });
                    },
                  ))
            ],
          ),
          Expanded(
              child: ReUsableCard(
                color: inActiveColor,
                child: Column(
                  children: [
                    Text(
                      "HEIGHT",
                      style: textStyle,
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          '$height',
                          style: valueStyle,
                        ),
                        Text(
                          'cm',
                          style: textStyle,
                        )
                      ],
                    ),
                    SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                            thumbColor: Colors.pinkAccent,
                            overlayColor: Color(0x29EB1555),
                            activeTrackColor: Colors.pink,
                            inactiveTrackColor: Colors.grey[500],
                            thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 15.0),
                            overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 30.0)),
                        child: Slider(
                          value: height.toDouble(),
                          min: 100,
                          max: 250,
                          onChanged: (double newValueHeight) {
                            setState(() {
                              height = newValueHeight.toInt();
                            });
                          },
                        ))
                  ],
                ),
              )),
          Row(
            children: [
              Expanded(
                  child: ReUsableCard(
                    color: inActiveColor,
                    child: Column(
                      children: [
                        Text(
                          "WEIGHT",
                          style: textStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: valueStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundedIconButton(
                                icon: FontAwesomeIcons.minus,
                                onPressed: () {
                                  setState(() {
                                    setState(() {
                                      weight--;
                                    });
                                  });
                                }),
                            SizedBox(
                              width: 5.0,
                            ),
                            RoundedIconButton(
                                icon: FontAwesomeIcons.plus,
                                onPressed: () {
                                  setState(() {
                                    weight++;
                                  });
                                }),
                          ],
                        )
                      ],
                    ),
                  )),
              Expanded(
                  child: ReUsableCard(
                    color: inActiveColor,
                    child: Column(
                      children: [
                        Text(
                          "AGE",
                          style: textStyle,
                        ),
                        Text(
                          age.toString(),
                          style: valueStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundedIconButton(
                                icon: FontAwesomeIcons.minus,
                                onPressed: () {
                                  setState(() {
                                    age--;
                                  });
                                }),
                            SizedBox(
                              width: 5.0,
                            ),
                            RoundedIconButton(
                                icon: FontAwesomeIcons.plus,
                                onPressed: () {
                                  setState(() {
                                    age++;
                                  });
                                }),
                          ],
                        )
                      ],
                    ),
                  ))
            ],
          ),
          BottomButton(title: "Calculate Your BMI", onPressed: () {
            CalculateBMI cal_bmi = CalculateBMI(height:height, weight: weight);
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return ResultPage(bmiResult: cal_bmi.calculateBMI(),
                  resultText: cal_bmi.getResult(),
                  interpretation: cal_bmi.getInterpertation());
            }));
          })
        ],
      ),
    );
  }
}
