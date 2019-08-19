import 'package:flutter/material.dart';
import 'package:smart_home/homepagewidget/mainpageswitch.dart';
import 'package:provider/provider.dart';
import 'package:smart_home/Model/homepagedata.dart';
import 'package:smart_home/util/util_smarthome.dart';
import 'package:smart_home/Model/homedatamodel.dart';
import 'package:smart_home/controlwidget/airconditionerControl.dart';

class HomePageCard extends StatelessWidget {
  final int index;

  HomePageCard({this.index});

  @override
  Widget build(BuildContext context) {
    final double screenSize = MediaQuery.of(context).size.width;
    final double cardWidth = (screenSize - 60) / 2;
    final bool isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
    return Consumer<HomePageData>(
        builder: (context, data, child){
          RoomInfoModel roomInfoModel = data.roomInfoData[index];
          return Card(
            elevation: roomInfoModel.isActive?6:0,
            color: Colors.white,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
            child: Container(
              height: isPortrait ? cardWidth*.95:180,
              width: isPortrait?cardWidth:180,
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Icon(
                         roomInfoModel.iconData,
                          color: roomInfoModel.isActive?Colors.blueAccent:Colors.grey,
                          size: 45,
                        ),
                        MainPageSwitch(
                          isFanOn: roomInfoModel.isActive,
                          switchFan: () {
                            data.switchOffAll(roomInfoModel);
                          },
                        )
                      ],
                    ),
                    GestureDetector(
                      onTap: (){
                        if(index==0){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => AirConditionerControlUnit()),
                          );
                        }
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            roomInfoModel.title,
                            style: cardTitleStyle.copyWith(color: roomInfoModel?.isActive?Colors.black:Colors.grey),
                          ),
                          Text(
                            roomInfoModel.isActive?roomInfoModel.subTitle:'',
                            style: dateTextStyle,
                            maxLines: 1,
                          )
                        ],
                      ),
                    )

                  ],
                ),
              ),
            ),
          );
        }
    );;
  }
}
