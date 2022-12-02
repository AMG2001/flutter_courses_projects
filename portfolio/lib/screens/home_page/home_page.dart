import 'package:flutter/material.dart';
import 'package:portfolio/screens/home_page/home_page_responsive/desktop_design.dart';
import 'package:portfolio/screens/home_page/home_page_responsive/mobile_design.dart';
import 'package:portfolio/screens/home_page/home_page_responsive/tablet_design.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (contexnt, constraints) {
        if (constraints.maxWidth < 500) {
          /**
           * return mobile design
           */
          return MobileDesign();
        } else if (constraints.maxWidth < 1100) {
          /**
           * return tablet design
           */
          return TabletDesign();
        } else {
          /**
           *  return Desktop design
           */
          return DesktopDesign();
        }
      },
    );
  }
}
