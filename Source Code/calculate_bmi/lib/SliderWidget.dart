import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

int valueHolder = 180;

class SliderWidget extends StatefulWidget {
  @override
  SiderWidgetState createState() => new SiderWidgetState();
}

class SiderWidgetState extends State {


  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(children: [
          Container(
              margin: EdgeInsets.fromLTRB(0, 100, 0, 0),
              child: Slider(
                  value: valueHolder.toDouble(),
                  min: 100,
                  max: 280,
                  divisions: 100,
                  activeColor: Colors.purple,
                  inactiveColor: Colors.grey,
                  label: '${valueHolder.round()}',
                  onChanged: (double newValue) {
                    setState(() {
                      valueHolder = newValue.round();
                    });
                  },
                  semanticFormatterCallback: (double newValue) {
                    return '${newValue.round()}';
                  })),
        ]));
  }
}