import 'package:flutter/material.dart';


class FanSpeedControl extends StatelessWidget {

  final bool isFanOn;
  final int fanSpeed;
  final Function changeFanSpeed;

  FanSpeedControl({this.isFanOn,this.fanSpeed,this.changeFanSpeed});

  @override
  Widget build(BuildContext context) {

    return Container(
      height: 35,
      width: 240,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          GestureDetector(
            onTap: ()=>changeFanSpeed(1),
            child: Container(
              width: 30,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(10),bottomLeft: Radius.circular(10)),
                  color: fanSpeed>=1&&isFanOn?Colors.blueAccent:Colors.grey[200]
              ),
            ),
          ),
          GestureDetector(
            onTap: ()=>changeFanSpeed(2),
            child: Container(
              width: 50,
              color: fanSpeed>=2&&isFanOn?Colors.blueAccent:Colors.grey[200],
            ),
          ),
          GestureDetector(
            onTap: ()=>changeFanSpeed(3),
            child: Container(
              width: 70,
              color: fanSpeed>=3&&isFanOn?Colors.blueAccent:Colors.grey[200],

            ),
          ),
          GestureDetector(
            onTap: ()=>changeFanSpeed(4),
            child: Container(
              width: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topRight: Radius.circular(10),bottomRight: Radius.circular(10)),
                color: fanSpeed==4&&isFanOn?Colors.blueAccent:Colors.grey[200],
              ),
            ),
          ),

        ],
      ),

    );;
  }
}
