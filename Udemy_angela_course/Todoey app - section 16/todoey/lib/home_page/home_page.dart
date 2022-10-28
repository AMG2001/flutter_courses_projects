import 'package:flutter/material.dart';
import 'package:todoey/config/dimensions.dart';
import 'package:todoey/home_page/home_page_components/home_page_header.dart';
import 'package:todoey/home_page/home_page_components/main_white_container.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.lightBlueAccent,
          onPressed: () {},
          child: Icon(Icons.add)),
      backgroundColor: Colors.lightBlueAccent,
      body: SafeArea(
        child: Container(
          width: Dimensions.width,
          height: Dimensions.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [HomePageHeader(), MainWhiteContainer()],
          ),
        ),
      ),
    );
  }
}
