import 'package:flutter/material.dart';
import 'package:intro_design/dimensions.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
            width: Dimensions.width,
            height: Dimensions.height,
            child: Column(
              children: [
                // Image(
                //   image: AssetImage('assets/intro-images/p1.jpg'),
                // )
              ],
            )),
      ),
    );
  }
}
