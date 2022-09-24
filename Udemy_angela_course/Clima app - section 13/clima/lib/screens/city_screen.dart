import 'package:flutter/material.dart';
import 'package:clima/utilities/constants.dart';
import 'package:get/get.dart';

class CityScreen extends StatefulWidget {
  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/city_background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: Icon(
                      Icons.arrow_back_ios,
                      size: 32.0,
                    ),
                  ),
                ),
              ),
              Form(
                key: formKey,
                child: Container(
                  padding: EdgeInsets.all(20.0),
                  child: TextFormField(
                    style: TextStyle(color: Colors.black),
                    validator: (value) {
                      if (value == "" || value == null) {
                        return "You can't leave this field empty !!";
                      }
                    },
                    decoration: InputDecoration(
                        hintText: "Enter City here",
                        hintStyle: TextStyle(color: Colors.grey),
                        filled: true,
                        fillColor: Colors.white,
                        icon: Icon(
                          Icons.location_city,
                          color: Colors.white,
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16))),
                  ),
                ),
              ),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.black),
                ),
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    // Feature is not supported in api again , so we will end here .
                  }
                },
                child: Text(
                  'Get Weather',
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
