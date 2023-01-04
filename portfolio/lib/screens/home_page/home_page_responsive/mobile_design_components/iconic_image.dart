import 'package:flutter/material.dart';
import 'package:portfolio/config/device_info.dart';
import 'package:lottie/lottie.dart';
import 'package:portfolio/core/images_paths/main_page_images_paths.dart';

class IconicImage extends StatelessWidget {
  const IconicImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Stack(
          children: [
            Container(
              padding: EdgeInsets.all(Dimensions.deviceWidth * .06),
              width: Dimensions.deviceWidth,
              child: Image(
                image: AssetImage(
                  MainPageImagesPaths.i_pageHeader,
                ),
                fit: BoxFit.fitWidth,
                alignment: Alignment.topCenter,
              ),
            ),
            Column(
              children: [
                SizedBox(
                  height: Dimensions.deviceHeight * .1,
                ),
                Image(
                  image: AssetImage(MainPageImagesPaths.i_mineIconicImage),
                ),
              ],
            )
          ],
        ),
        Positioned(
          top: Dimensions.deviceHeight * .022,
          left: Dimensions.deviceWidth * .4,
          child: Lottie.network(
              "https://assets4.lottiefiles.com/packages/lf20_96bovdur.json",
              frameRate: FrameRate.max,
              width: Dimensions.deviceWidth * .4),
        ),
      ],
    );
  }
}
