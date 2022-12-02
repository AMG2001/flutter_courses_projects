import 'package:portfolio/config/device_info.dart';
import 'package:portfolio/core/images_paths/navbar_images_paths.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class MobileDesign extends StatelessWidget {
  final Uri githubUrl = Uri.parse('https://github.com/MavicaSoftwareDev');
  final Uri linkedInUrl =
      Uri.parse('https://www.linkedin.com/in/mohamad-amgad-239114159/');
  final Uri twitterUrl = Uri.parse('https://twitter.com/mohamadamgad6');

  Future<void> _launchUrl(Uri link) async {
    if (!await launchUrl(link)) {
      throw 'Could not launch $link';
    }
  }

  MobileDesign({super.key});

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () async {
                await _launchUrl(githubUrl);
              },
              icon: FaIcon(
                FontAwesomeIcons.github,
                color: Colors.black,
              )),
          IconButton(
              onPressed: () async {
                await _launchUrl(twitterUrl);
              },
              icon: FaIcon(
                FontAwesomeIcons.twitter,
                color: Colors.black,
              )),
          IconButton(
              onPressed: () async {
                await _launchUrl(linkedInUrl);
              },
              icon: FaIcon(
                FontAwesomeIcons.linkedin,
                color: Colors.black,
              )),
        ],
        elevation: 15.0,
        backgroundColor: Colors.white,
        title: Image(
          image: AssetImage(NavBarImagesPaths.amgadLogo),
          fit: BoxFit.cover,
          width: Dimentsions.deviceWidth * .35,
        ),
      ),
      body: ListView(
        children: [
          Container(
            width: Dimentsions.deviceWidth,
            height: Dimentsions.deviceHeight * 7.5,
            child: Stack(
              children: [
                Container(
                  height: Dimentsions.deviceHeight * 7.5,
                  width: Dimentsions.deviceWidth,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.fitWidth,
                      alignment: Alignment.topCenter,
                      image: AssetImage("assets/images/screen_1_mobile.png"),
                    ),
                  ),
                ),
                Positioned(
                  top: Dimentsions.deviceHeight * .02,
                  left: Dimentsions.deviceWidth * .4,
                  child: Lottie.network(
                      "https://assets4.lottiefiles.com/packages/lf20_96bovdur.json",
                      width: Dimentsions.deviceWidth * .4),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
