import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_home/Model/homeinfodata.dart';
import 'package:smart_home/dialwidget/gesturedetector.dart';


class KnobContainer extends StatelessWidget {
  final int activeTab;
  KnobContainer(this.activeTab);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
      ),
      child: Consumer<HomeInfoData>(
        builder: (context,infoData,child){
          return CircleGestureDetector(
              infoModel: infoData,
              index:activeTab);
        },

      ),
    );
  }
}