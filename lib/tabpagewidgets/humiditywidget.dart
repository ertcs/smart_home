import 'package:flutter/material.dart';

class HumidityWidget extends StatelessWidget {
  final String humidityUnit;

  HumidityWidget(this.humidityUnit);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          'Humidity',
          style: TextStyle(color: Colors.grey),
        ),
        Text(
          humidityUnit,
          style: TextStyle(
            fontSize: 20,
            color: Colors.black,
          ),
        )
      ],
    );
  }
}
