import 'package:flutter/material.dart';
import 'package:portfolio/config/device_info.dart';

class Page2Desktop extends StatelessWidget {
  const Page2Desktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Dimentsions.deviceWidth,
      height: Dimentsions.deviceHeight,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/Desktop_screen_2.png'))),
    );
  }
}
