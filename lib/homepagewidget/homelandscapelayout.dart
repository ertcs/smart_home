import 'package:flutter/material.dart';
import 'package:smart_home/homepagewidget/homeappbar.dart';
import 'package:smart_home/util/util_smarthome.dart';
import 'homepagecard.dart';
import 'musicplayerwidget.dart';
import 'addnewwideget.dart';

class HomeLandScapeLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        HomeAppBar(),
        SizedBox(
          height: 10,
        ),
        Text(
          'Devices'.toUpperCase(),
          style: dateTextStyle.copyWith(color: Colors.grey[700]),
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            HomePageCard(
              index: 0,
            ),
            HomePageCard(
              index: 1,
            ),
            HomePageCard(
              index: 3,
            ),
            HomePageCard(
              index: 4,
            ),
          ],
        ),
        MusicCardWidget(),
        AddNewWidget(),
        SizedBox(height: 30,)
      ],
    );
  }
}