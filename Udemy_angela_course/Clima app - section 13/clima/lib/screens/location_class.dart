import 'dart:convert';

import 'package:clima/screens/city_screen.dart';
import 'package:clima/services/location_screen_controller.dart';
import 'package:clima/services/weather.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class Location {
  final controller = Get.put(LocationScreenController(), permanent: true);
  String _APIKey = "409ef58c1f2aab50eacc7a6ed7d70a89";
  late double _latitude;
  late double _longitude;
  late Map<String, dynamic> locationDataMap;
  /**
   * get current location method
   */
  Future<void> getCurrentLocation() async {
    try {
      checkLocationPermission();
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      _latitude = position.latitude;
      print("latitude = $_latitude");
      _longitude = position.longitude;
      print("longitude = $_longitude");
      // getCurrentLocationInfo();
    } catch (e) {
      print(e);
      checkLocationPermission();
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      _latitude = position.latitude;
      print("latitude = $_latitude");
      _longitude = position.longitude;
      print("longitude = $_longitude");
    }
  }

/**
 * Check GPS Permission on mobile .
 */
  Future<void> checkLocationPermission() async {
    LocationPermission permission = await Geolocator.requestPermission();
    print(permission);
  }

/**
 * Fetch user location via lang and lat .
 */
  Future<void> getCurrentLocationInfo() async {
    /**
       * Show loading Indicator
       */

    http.Response response = await http.get(Uri.parse(
        "https://api.openweathermap.org/data/3.0/onecall?lat=$_latitude&lon=$_longitude&exclude=daily&appid=409ef58c1f2aab50eacc7a6ed7d70a89"));
    Map<String, dynamic> locationData = jsonDecode(response.body);
    controller.createLocationValues(locationData);
  }
}
