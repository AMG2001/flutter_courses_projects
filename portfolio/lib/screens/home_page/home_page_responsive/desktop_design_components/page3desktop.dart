import 'package:flutter/material.dart';
import 'package:portfolio/config/device_info.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Page3Desktop extends StatelessWidget {
  const Page3Desktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Dimensions.deviceWidth,
      height: Dimensions.deviceHeight,
      child: Stack(
        children: [
          Container(
              width: Dimensions.deviceWidth,
              height: Dimensions.deviceHeight,
              child: SvgPicture.asset('assets/images/Mine_Iconic_Image.svg')),
        ],
      ),
    );
  }
}
