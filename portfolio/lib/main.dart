import 'package:flutter/material.dart';
import 'package:portfolio/screens/home_page/home_page.dart';
import 'package:get/get.dart';
void main() {
  runApp(Portfolio());
}



class Portfolio extends StatelessWidget {
  const Portfolio({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "mine portfolio",
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
