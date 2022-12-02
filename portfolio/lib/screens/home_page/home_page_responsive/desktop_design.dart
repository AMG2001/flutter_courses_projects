import 'package:portfolio/config/device_info.dart';
import 'package:portfolio/core/images_paths/navbar_images_paths.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/screens/home_page/home_page_responsive/desktop_design_components/desktopAppbar.dart';
import 'package:portfolio/screens/home_page/home_page_responsive/desktop_design_components/page1desktop.dart';
import 'package:portfolio/screens/home_page/home_page_responsive/desktop_design_components/page2desktop.dart';
import 'package:portfolio/screens/home_page/home_page_responsive/desktop_design_components/page3Desktop.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DesktopDesign extends StatefulWidget {
  DesktopDesign({super.key});

  @override
  State<DesktopDesign> createState() => _DesktopDesignState();
}

class _DesktopDesignState extends State<DesktopDesign> {
  final Uri githubUrl = Uri.parse('https://github.com/MavicaSoftwareDev');

  final Uri linkedInUrl =
      Uri.parse('https://www.linkedin.com/in/mohamad-amgad-239114159/');

  final Uri twitterUrl = Uri.parse('https://twitter.com/mohamadamgad6');
  Future<void> _launchUrl(Uri link) async {
    if (!await launchUrl(link)) {
      throw 'Could not launch $link';
    }
  }

  int currentIndex = 0;

  List<Widget> pagesList = [Page1Desktop(), Page2Desktop(), Page3Desktop()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: EdgeInsets.all(8),
            child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.black),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(45),
                    ),
                  ),
                ),
                onPressed: () async {
                  await _launchUrl(githubUrl);
                },
                child: Row(
                  children: [
                    FaIcon(
                      FontAwesomeIcons.github,
                      color: Colors.white,
                    ),
                    Text("  Github")
                  ],
                )),
          ),
          Padding(
            padding: EdgeInsets.all(8),
            child: TextButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(45),
                    ),
                  ),
                ),
                onPressed: () async {
                  await _launchUrl(twitterUrl);
                },
                child: Row(
                  children: [
                    FaIcon(
                      FontAwesomeIcons.twitter,
                      color: Colors.blueAccent,
                    ),
                    Text("  Twitter")
                  ],
                )),
          ),
          Padding(
            padding: EdgeInsets.all(8),
            child: TextButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(45),
                    ),
                  ),
                ),
                onPressed: () async {
                  await _launchUrl(linkedInUrl);
                },
                child: Row(
                  children: [
                    FaIcon(
                      FontAwesomeIcons.linkedin,
                      color: Colors.blueAccent,
                    ),
                    Text("  LinkedIn")
                  ],
                )),
          ),
        ],
        elevation: 15.0,
        backgroundColor: Colors.white,
        title: Image(
          image: AssetImage(NavBarImagesPaths.amgadLogo),
          fit: BoxFit.cover,
          width: Dimentsions.deviceWidth * .12,
        ),
      ),
      body: PageView.builder(
          allowImplicitScrolling: true,
          scrollDirection: Axis.vertical,
          itemCount: pagesList.length,
          pageSnapping: false,
          onPageChanged: (value) {
            setState(() {
              currentIndex = value;
            });
          },
          itemBuilder: ((context, index) {
            return pagesList[index];
          })),
    );
  }
}

/**
 * Container(
        width: Dimentsions.deviceWidth,
        height: Dimentsions.deviceHeight,
        child: Stack(
          children: [
            Container(
              width: Dimentsions.deviceWidth,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/images/page_header.png"),
                ),
              ),
            ),
            Positioned(
              top: Dimentsions.deviceHeight * .03,
              left: Dimentsions.deviceWidth * .09,
              child: Lottie.network("https://assets4.lottiefiles.com/packages/lf20_96bovdur.json",
                  width: Dimentsions.deviceWidth * .09),
            ),
          ],
        ),
      
 */