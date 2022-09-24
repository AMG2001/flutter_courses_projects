import 'package:clima/services/weather.dart';
import 'package:get/get.dart';

class LocationScreenController extends GetxController {
  late double temp;
  late String iconShape;
  late String message;
  void createLocationValues(Map<String, dynamic> map) {
    this.temp = (map['current']['temp'] - 273.1);
    
    this.iconShape =
        WeatherModel().getWeatherIcon(map['current']['weather'][0]['id']);
    this.message = WeatherModel().getMessage((this.temp).toInt());
    print("Temp = ${temp}");
    print("iconShape = $iconShape");
    print("message = $message");
    update();
  }

  Map<String, dynamic> getLocationInfo() {
    return {
      "temp": this.temp,
      "iconShape": this.iconShape,
      "message": this.message
    };
  }
}
