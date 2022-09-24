import 'package:flutter/material.dart';
import 'package:music_project/home_page.dart';

void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Music app",
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
