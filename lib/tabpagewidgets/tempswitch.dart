
import 'package:flutter/material.dart';


class TempSwitch extends StatelessWidget {
  final bool isFanOn;
  final Function switchFan;

  TempSwitch(this.isFanOn,this.switchFan);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: switchFan,
      child: Container(
        height: 35,width: 64,
        decoration: BoxDecoration(
            color: isFanOn?Colors.blueAccent:Colors.grey[300],
            borderRadius: BorderRadius.circular(10)
        ),
        child: Padding(
            padding: EdgeInsets.all(3),
            child: Align(
              alignment: isFanOn?Alignment.centerLeft:Alignment.centerRight,
              child: Container(
                width: 30,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(6)
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 7,bottom: 7,right: 3),
                      child: Container(color: Colors.grey[300],width: 2,),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 7,bottom: 7),
                      child: Container(color: Colors.grey[300],width: 2,),
                    ),
                  ],
                ),
              ),
            )
        ),
      ),
    );
  }
}
