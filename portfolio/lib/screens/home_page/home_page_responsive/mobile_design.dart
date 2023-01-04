import 'package:portfolio/config/device_info.dart';
import 'package:portfolio/core/images_paths/main_page_images_paths.dart';
import 'package:portfolio/core/images_paths/navbar_images_paths.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/screens/home_page/home_page_responsive/mobile_design_components/iconic_image.dart';
import 'package:portfolio/screens/home_page/home_page_responsive/mobile_design_components/stars_section.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
          width: Dimensions.deviceWidth * .35,
        ),
      ),
      body: ListView(
        children: [
          Stack(
            children: [IconicImage(), StarsSection()],
          )
        ],
      ),
    );
  }
}
