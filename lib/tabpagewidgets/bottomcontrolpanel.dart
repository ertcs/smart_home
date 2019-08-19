import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_home/Model/homeinfodata.dart';
import 'package:smart_home/tabpagewidgets/tempswitch.dart';
import 'package:smart_home/tabpagewidgets/fancontroller.dart';
import 'package:smart_home/Model/homeinfomodel.dart';


// not in use

class BottomControlPanel extends StatelessWidget {
  final int tabIndex;

  BottomControlPanel(this.tabIndex);

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeInfoData>(
      builder: (context,data,child){
        HomeInfoModel roomData = data.infoData[tabIndex];
        bool ismyFanOn = roomData.isFanOn;
        return Container(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 35),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(
                      left: 20, bottom: 20, top: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('Turn on/off'),
                      SizedBox(
                        height: 5,
                      ),
                      TempSwitch(roomData.isFanOn,(){
                        data.switchFan(roomData);
                      }),
                    ],
                  ),
                ),
                Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(
                          right: 20, bottom: 20, top: 10, left: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Text('Set Speed'),
                          SizedBox(
                            height: 5,
                          ),
                          FanSpeedControl(
                            isFanOn: roomData.isFanOn,
                            fanSpeed: roomData.fanSpeed,
                            changeFanSpeed: (speed){
                              data.changeFanSpeed(roomData, speed);

                            },
                          )
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
