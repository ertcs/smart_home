import 'package:flutter/material.dart';
import 'package:smart_home/util/util_smarthome.dart';
import 'homepagecard.dart';
import 'musicplayerwidget.dart';
import 'addnewwideget.dart';

class HomePortraitLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 30),
        Text(
          'Devices'.toUpperCase(),
          style: dateTextStyle.copyWith(color: Colors.grey[700]),
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          children: <Widget>[
            HomePageCard(
              index: 0,
            ),
            HomePageCard(
              index: 1,
            ),
          ],
        ),
        MusicCardWidget(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            HomePageCard(
              index: 3,
            ),
            HomePageCard(
              index: 4,
            ),
          ],
        ),
        AddNewWidget(),
        SizedBox(height: 30,)

      ],
    );
  }
}