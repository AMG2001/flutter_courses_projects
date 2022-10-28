import 'package:flutter/material.dart';
import 'package:todoey/config/dimensions.dart';

class MainWhiteContainer extends StatelessWidget {
  const MainWhiteContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: Dimensions.width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
        ),
        child: Column(children: []),
      ),
    );
  }
}
