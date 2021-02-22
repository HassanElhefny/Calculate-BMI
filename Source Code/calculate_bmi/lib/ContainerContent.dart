import 'package:flutter/cupertino.dart';

class ContainerContent extends StatelessWidget {
  final IconData iconData;
  final String title;

  ContainerContent({this.iconData, this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          iconData,
          size: 80.0,
        ),
        SizedBox(
          height: 20.0,
        ),
        Text(title),
        SizedBox(
          height: 10.0,
        )
      ],
    );
  }
}