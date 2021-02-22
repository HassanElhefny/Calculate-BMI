import 'package:calculate_bmi/Constan.dart';
import 'package:flutter/material.dart';

class BottomButton extends StatelessWidget {
  final String title;
  final Function onPressed;

  BottomButton({@required this.title, @required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onPressed,
        child: Container(
          color: bottomColor,
          padding: EdgeInsets.only(top: 10.0),
          height: 80.0,
          width: double.infinity,
          child: Center(
            child: Text(
              title,
              style: buttonBottomStyle,
              textAlign: TextAlign.center,
            ),
          ),
        ));
  }
}
