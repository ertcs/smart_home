import 'package:flutter/material.dart';
import 'package:smart_home/tabpagewidgets/tempswitch.dart';
import 'package:smart_home/tabpagewidgets/fancontroller.dart';
import 'dart:math';
import 'package:smart_home/tabpagewidgets/currenttempwidget.dart';
import 'package:smart_home/tabpagewidgets/humiditywidget.dart';
import 'package:smart_home/tabpagewidgets/changetempwidget.dart';
import 'package:smart_home/Model/homeinfodata.dart';
import 'package:smart_home/Model/homeinfomodel.dart';
import 'package:provider/provider.dart';
import 'package:smart_home/dialwidget/tickerpainter.dart';
import 'package:smart_home/dialwidget/knobcontainer.dart';

class AirConditionerControlUnit extends StatefulWidget {
  @override
  _AirConditionerControlUnitState createState() => _AirConditionerControlUnitState();
}

class _AirConditionerControlUnitState extends State<AirConditionerControlUnit>with SingleTickerProviderStateMixin {
  TabController _tabController;
  List<HomeInfoModel> homeInfoData = HomeInfoData().infoData;

  @override
  void initState() {
    _tabController = new TabController(length: homeInfoData.length, vsync: this);

  }


  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bool isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
    return DefaultTabController(
      length: homeInfoData.length,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: (
            AppBar(
                brightness: Brightness.light,
                backgroundColor: Colors.grey[200],
                elevation: 0,
                leading: GestureDetector(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.keyboard_backspace,
                    color: Colors.blueAccent,
                    size: 30,
                  ),
                ),
                title: Text(
                  'Air Conditioner',
                  style: TextStyle(color: Colors.black),
                ),
                bottom: TabBar(
                  indicator: UnderlineTabIndicator(
                    borderSide: BorderSide(width: 3.0, color: Colors.blueAccent),
                    insets: EdgeInsets.symmetric(horizontal: isPortrait?20.0:5.0),
                  ),
                  labelColor: Colors.black,
                  labelStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  unselectedLabelColor: Colors.grey,
                  unselectedLabelStyle: TextStyle(fontSize: 16),
                  isScrollable: true,
                  controller: _tabController,
                  tabs: tabTextWidget(homeInfoData,isPortrait),
                ))),
        body: ChangeNotifierProvider(
          builder: (context)=> HomeInfoData(),
          child: TabBarView(
            children: tabContainWidget(homeInfoData,isPortrait),
            controller: _tabController,
          ),
        ),
      ),
    );
  }
}

List<Widget> tabTextWidget(List<HomeInfoModel> homeInfoData,bool isPortrait ) {

  List<Widget> tabList = [];
  for (int i = 0; i < homeInfoData.length; i++) {
    tabList.add(Column(
      children: <Widget>[
        Text(
          homeInfoData[i].title,
        ),
        SizedBox(
          height: isPortrait?10:2,
        )
      ],
    ));
  }

  return tabList;
}


List<Widget> tabContainWidget(List<HomeInfoModel> infoData, bool isPortrait) {
  List<Widget> tabList = [];
  for (var i = 0; i < infoData.length; ++i) {
    tabList.add(
        Container(
            height: double.infinity,
            width: double.infinity,
            color: Colors.grey[200],
            child: isPortrait?PortraitAirConditionerUnit(i):LandScapeAirConditionerUnit(i)
        )
    );
  }



  return tabList;
}

class LandScapeAirConditionerUnit extends StatelessWidget {
  final int index;

  LandScapeAirConditionerUnit(this.index);

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeInfoData>(
      builder: (context,data,child){
        HomeInfoModel roomData = data.infoData[index];
        return Container(
          margin: EdgeInsets.only(right: 8.0,top: 8.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(30), topLeft: Radius.circular(30)),
            color: Colors.white,
          ),
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        CurrentTempWidget(roomData.currentTemp),
                        Container(height: 50, width: 2, color: Colors.grey[300],),
                        HumidityWidget(roomData.humidity),
                      ],
                    ),
                    ChangeTempWidget(roomData.setTemp),
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 5),
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
                    )

                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.only(top:20.0),
                  child: Container(
                    child: Stack(
                      children: <Widget>[
                        Transform.rotate(
                          angle: (2*pi)*0.25,
                          child: Container(
                            height: 360,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                            ),
                            child:Container(
                              height: double.infinity,
                              width: double.infinity,
                              padding: EdgeInsets.all(90),
                              child: CustomPaint(
                                painter: TickPainter(currentTem: roomData.setTemp),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: 300,
                          width: double.infinity,
                          color: Colors.transparent,
                          child: KnobContainer(index),
                        ),


                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}


class PortraitAirConditionerUnit extends StatelessWidget {
  final int i;

  PortraitAirConditionerUnit(this.i);

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeInfoData>(
      builder: (context,data,child){
        HomeInfoModel roomData = data.infoData[i];
        return Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 30,
            ),
            Container(
              margin: EdgeInsets.only(right: 8.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30), topLeft: Radius.circular(30)),
                color: Colors.white,
              ),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      CurrentTempWidget(roomData.currentTemp),
                      Container(
                        height: 50,
                        width: 2,
                        color: Colors.grey[300],
                      ),
                      HumidityWidget(roomData.humidity),
                    ],
                  ),
                  ChangeTempWidget(roomData.setTemp),
                  Stack(
                    children: <Widget>[
                      Transform.rotate(
                        angle: (2*pi)*0.25,
                        child: Container(
                          height: 360,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                          child:Container(
                            height: double.infinity,
                            width: double.infinity,
                            padding: EdgeInsets.all(75),
                            child: CustomPaint(
                              painter: TickPainter(currentTem: roomData.setTemp),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 360,
                        width: double.infinity,
                        color: Colors.transparent,
                        child: KnobContainer(i),
                      ),

                    ],
                  ),
                  Container(
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
                  )
                ],
              ),
            ),
          ],
        );

      },
    );
  }
}

