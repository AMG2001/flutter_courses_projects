import 'package:flutter/material.dart';
import 'package:intro_design/screens/intro_screen/intro_screen.dart';

void main(){
  runApp(IntroDesign());
}


class IntroDesign extends StatelessWidget {
  const IntroDesign({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: IntroScreen(),
    );
  }
}