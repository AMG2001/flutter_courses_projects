import 'package:flutter/material.dart';
import 'package:portfolio/config/device_info.dart';
import 'package:lottie/lottie.dart';

class Page1Desktop extends StatelessWidget {
  const Page1Desktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.all(Dimentsions.deviceWidth * .05),
              child: Image(image: AssetImage('assets/images/screen1_1.png')),
            ),
            Container(
                margin: EdgeInsets.only(
                    top: Dimentsions.deviceHeight * .1,
                    right: Dimentsions.deviceWidth * .02),
                child: Image(image: AssetImage('assets/images/screen1_2.png')))
          ],
        ),
        Positioned(
          left: Dimentsions.deviceWidth * .09,
          child: Lottie.network(
              "https://assets4.lottiefiles.com/packages/lf20_96bovdur.json",
              width: Dimentsions.deviceWidth * .09),
        ),
      ],
    );
  }
}
