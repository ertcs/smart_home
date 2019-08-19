import 'package:flutter/material.dart';

class HomeDataModel {
  UserInfoModel userInfoModel;
  RoomInfoModel roomInfoModel;

  HomeDataModel(this.userInfoModel,this.roomInfoModel);
}

class UserInfoModel {
  String userImage;
  int notificationCount;

  UserInfoModel(
      {this.userImage =
          'https://content-static.upwork.com/uploads/2014/10/01073429/profilephoto2.jpg',
      this.notificationCount = 5})
  ;
}

class RoomInfoModel {
  bool isActive;
  String title;
  String subTitle;
  IconData iconData;
  RoomInfoModel({
    this.isActive = false,
    this.title,
    this.subTitle,
    this.iconData,
  });

  void switchToggle() {
    isActive = !isActive;
  }
}
