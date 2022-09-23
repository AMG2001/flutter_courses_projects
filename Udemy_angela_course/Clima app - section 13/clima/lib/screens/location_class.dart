import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

class Location {
  late double latitude;

  late double longitude;
  late http.Response response;
  Future<void> getCurrentLocation() async {
    try {
      checkLocationPermission();
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      latitude = position.latitude;
      print("latitude = $latitude");
      longitude = position.longitude;
      print("longitude = $longitude");
    } catch (e) {
      print(e);
      checkLocationPermission();
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      latitude = position.latitude;
      print("latitude = $latitude");
      longitude = position.longitude;
      print("longitude = $longitude");
    }
  }

  Future<void> checkLocationPermission() async {
    LocationPermission permission = await Geolocator.requestPermission();
    print(permission);
  }

  Future<void> getCityInformations()async{
    
  }
}
