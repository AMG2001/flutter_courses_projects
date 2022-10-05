import 'package:camera_project/pages/home_page/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(CameraApp());
}


class CameraApp extends StatelessWidget {
  const CameraApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: "Camera App",
      home: HomePage(),
      debugShowCheckedModeBanner:  false,
    );
  }
}
