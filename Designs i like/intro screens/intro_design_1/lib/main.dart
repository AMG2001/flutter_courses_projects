import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intro_design_1/intro_screen/intro_screen.dart';

void main() {
  runApp(IntroDesign1());
}



class IntroDesign1 extends StatelessWidget {
  const IntroDesign1({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: IntroScreen(),
    );
  }
}
