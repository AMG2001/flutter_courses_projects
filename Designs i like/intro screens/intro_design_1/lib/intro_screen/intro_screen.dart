import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intro_design_1/intro_screen/dimensions.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  int pageIndex = 0;
  List<Widget> pages = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: Dimensions.height,
          width: Dimensions.width,
          child: PageView.builder(
            itemCount: pages.length,
            itemBuilder: ((context, index) {
              return pages[index];
            }),
          ),
        ),
      ),
    );
  }
}
