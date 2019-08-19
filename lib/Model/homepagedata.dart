import 'package:flutter/foundation.dart';
import 'package:smart_home/Model/homedatamodel.dart';
import 'package:smart_home/icons/my_flutter_app_icons.dart';

class HomePageData extends ChangeNotifier {
  List<UserInfoModel> userInfo = [
    UserInfoModel(
        userImage:
            'https://content-static.upwork.com/uploads/2014/10/01073429/profilephoto2.jpg',
        notificationCount: 1)
  ];

  List<RoomInfoModel> roomInfoData = [
    RoomInfoModel(
        title: 'Temperature',
        subTitle: 'Bedroom,Kitchen',
        isActive: true,
        iconData: CustomIcons.temperatire),
    RoomInfoModel(
        title: 'Lights',
        subTitle: 'Bedroom,Kitchen',
        isActive: true,
        iconData: CustomIcons.lightbulb_outline),
    RoomInfoModel(
        title: 'Music',
        subTitle: 'Johg Robinson - N',
        isActive: true,
        iconData: CustomIcons.music),
    RoomInfoModel(
        title: 'Smart TV',
        subTitle: 'Playing HBO',
        isActive: false,
        iconData: CustomIcons.television),
    RoomInfoModel(
        title: 'Router',
        subTitle: '128.67/Mbit/s',
        isActive: true,
        iconData: CustomIcons.router)
  ];

  void switchOffAll(RoomInfoModel roomInfoModel) {
    roomInfoModel.switchToggle();
    notifyListeners();
  }
}
