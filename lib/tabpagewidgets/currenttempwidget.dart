import 'package:flutter/material.dart';

class CurrentTempWidget extends StatelessWidget {
  final String currentTemp;

  CurrentTempWidget(this.currentTemp);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          'Current temp.',
          style: TextStyle(color: Colors.grey),
        ),
        Text(
          currentTemp,
          style: TextStyle(
            fontSize: 20,
            color: Colors.black,
          ),
        )
      ],
    );
  }
}
