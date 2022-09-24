import 'package:clima/screens/city_screen.dart';
import 'package:clima/screens/location_class.dart';
import 'package:clima/services/location_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:clima/utilities/constants.dart';
import 'package:get/get.dart';

class LocationScreen extends StatefulWidget {
  var locationScreenController =
      Get.put(LocationScreenController(), permanent: true);
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  @override
  Widget build(BuildContext context) {
    // widget.locationScreenController
    //     .createLocationValues(locationObj.locationDataMap);
    // print(widget.locationScreenController.temp);
    // print(widget.locationScreenController.message);
    // print(widget.locationScreenController.iconShape);
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: GetBuilder<LocationScreenController>(builder: (context) {
          return SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.near_me,
                          size: 50.0,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          Get.to(CityScreen());
                        },
                        icon: Icon(
                          Icons.location_city,
                          size: 50.0,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 15.0),
                  child: Row(
                    children: <Widget>[
                      Text(
                        '${widget.locationScreenController.temp.toStringAsFixed(2)}°',
                        style: kTempTextStyle,
                      ),
                      Text(
                        '${widget.locationScreenController.iconShape}',
                        style: kConditionTextStyle,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 15.0),
                  child: Text(
                    "${widget.locationScreenController.message}",
                    textAlign: TextAlign.right,
                    style: kMessageTextStyle,
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
