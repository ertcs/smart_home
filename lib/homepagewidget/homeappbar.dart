import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_home/Model/homepagedata.dart';
import 'package:smart_home/util/util_smarthome.dart';

class HomeAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<HomePageData>(
      builder: (context, data,child){
      return  Padding(
        padding: const EdgeInsets.only(top: 58),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  getCurrentDate,
                  style:
                  dateTextStyle.copyWith(color: Colors.grey[700]),
                ),
                Text(
                  'Smart home',
                  style: homeTitleTextStyle,
                )
              ],
            ),
            Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Center(
                  child: CircleAvatar(
                    backgroundImage:
                    NetworkImage(data.userInfo[0].userImage),
                  ),
                ),

                data.userInfo[0].notificationCount>0?
                Padding(
                  padding: EdgeInsets.only(
                    left: 30,
                    bottom: 30,
                  ),
                  child: Container(
                    height: 20,
                    width: 20,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        border:
                        Border.all(color: Colors.white, width: 2),
                        shape: BoxShape.circle),
                    child: Center(
                        child: Text(
                          data.userInfo[0].notificationCount.toString(),
                          style: notificationTextStyle,
                        )),
                  ),
                ):Container()
              ],
            )
          ],
        ),
      );
      },
    );
  }
}
