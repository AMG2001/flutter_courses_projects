import 'package:clima/screens/location_class.dart';
import 'package:clima/screens/location_screen.dart';
import 'package:clima/services/location_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  final controller = Get.put(LocationScreenController(), permanent: true);
  /**
   * Location Object
   */
  Location locationObj = Location();
  /**
    * Get location Lat & long
    */
  await locationObj.getCurrentLocation();
  await locationObj.getCurrentLocationInfo();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData.dark(),
      home: LocationScreen(),
    );
  }
}
