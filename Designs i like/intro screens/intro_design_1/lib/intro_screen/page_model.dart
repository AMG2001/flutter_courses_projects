import 'package:flutter/material.dart';
import 'package:intro_design_1/intro_screen/dimensions.dart';

class PageModel extends StatelessWidget {
  const PageModel({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Dimensions.width,
      height: Dimensions.height,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(""),
        ),
      ),
      child: Column(
        children: [],
      ),
    );
  }
}
