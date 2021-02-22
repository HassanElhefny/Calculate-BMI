import 'package:flutter/material.dart';
import 'Constan.dart';

class RoundedIconButton extends StatelessWidget {
  final IconData icon;
  final Function onPressed;

  RoundedIconButton({@required this.icon, @required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      fillColor: activeColor,
      elevation: 6.0,
      child: Icon(icon),
      shape: CircleBorder(),
      constraints: BoxConstraints.tightFor(width: 56.0, height: 56.0),
    );
  }
}
