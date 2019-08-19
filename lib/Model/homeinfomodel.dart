

class HomeInfoModel {
  String title;
  String currentTemp;
  String humidity;
  int setTemp;
  int fanSpeed;
  bool isFanOn;
  double knobReading;

  HomeInfoModel({
    this.title="room",
    this.isFanOn = false,
    this.humidity = '24%',
    this.setTemp =0,
    this.fanSpeed=2,
    this.currentTemp='28°C',
    this.knobReading,
  });

  void switchFan() {
    isFanOn = !isFanOn;
  }

  void setFanSpeed(int speed){
    fanSpeed = speed;
  }

  void setKnobReading(double reading){
    knobReading = reading;
  }


}
