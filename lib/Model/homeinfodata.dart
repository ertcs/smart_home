import 'package:flutter/foundation.dart';
import 'package:smart_home/Model/homeinfomodel.dart';
import 'activetabmodel.dart';

class HomeInfoData extends ChangeNotifier {
  List<HomeInfoModel> infoData = [
    HomeInfoModel(
        title: 'Living Room',
        isFanOn: false,
        humidity: '33%',
        setTemp: 23,
        fanSpeed: 0,
        currentTemp: '25°C',
        knobReading: 0.37
    ),
    HomeInfoModel(
        title: 'Dining',
        isFanOn: true,
        humidity: '30%',
        setTemp: 16,
        fanSpeed: 1,
        currentTemp: '18°C',
      knobReading: 0.26
    ),
    HomeInfoModel(
        title: 'Kitchen',
        isFanOn: false,
        humidity: '48%',
        setTemp: 28,
        fanSpeed: 3,
        currentTemp: '30°C',
       knobReading: 0.45
    ),
    HomeInfoModel(
        title: 'Bathroom',
        isFanOn: true,
        humidity: '30%',
        setTemp: 24,
        fanSpeed: 3,
        currentTemp: '25°C',
        knobReading: 0.386
    ),
  ];

  ActiveTabIndex tabIndex;

  void setTabIndex(int index){
    tabIndex.setActiveTabIndex(index);
    notifyListeners();
  }

  int get tabIndexCount{
    return tabIndex.activeIndex;
  }


  void changeFanSpeed(HomeInfoModel infoModel, int speed) {
    infoModel.setFanSpeed(speed);
    notifyListeners();
  }

  HomeInfoModel infoModel(int index) {
    return infoData[index];
  }

  void changeTemp(HomeInfoModel infoModel, int changeTemp) {
    infoModel.setTemp = changeTemp;
    notifyListeners();
  }

  int get roomCount {
    return infoData.length;
  }

  void switchFan(HomeInfoModel infoModel){
    infoModel.switchFan();
    notifyListeners();
  }

  void setKnobPreCent(HomeInfoModel infoModel, double reading){
    infoModel.setKnobReading(reading);
    notifyListeners();

  }

  double getKnobReading(int index){
    return infoData[index].knobReading;
  }




}
