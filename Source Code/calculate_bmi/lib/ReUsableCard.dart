import 'package:flutter/cupertino.dart';

class ReUsableCard extends StatelessWidget {
  final Color color;
  final Widget child;
  final Function work;

  ReUsableCard({this.color, this.child,this.work});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: work,
      child: Container(
        margin: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(10.0)),
        child: child,
      ),
    );
  }
}