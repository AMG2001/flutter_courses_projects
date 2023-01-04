import 'package:flutter/material.dart';
import 'package:portfolio/config/device_info.dart';
import 'package:portfolio/core/images_paths/main_page_images_paths.dart';

class StarsSection extends StatelessWidget {
  const StarsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: Dimensions.deviceHeight * .76,
        ),
        Section(path: MainPageImagesPaths.i_mobileDeveloperSection),
        Section(path: MainPageImagesPaths.i_selfLearnerSection),
      ],
    );
  }
}

class Section extends StatelessWidget {
  Section({required this.path});
  late String path;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 48, vertical: 12),
        child: Image(
          alignment: Alignment.center,
          image: AssetImage(path),
          fit: BoxFit.cover,
        ));
  }
}
