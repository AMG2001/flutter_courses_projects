import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_learn/home_page_controller.dart';

class HomePage extends StatelessWidget {
  final homePageController = Get.put(HomePageController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Home Page"),
        ),
        body: SafeArea(
          child: Container(
              height: Get.height,
              width: Get.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  /**
           * both getBuilder with the same controlelr , but the difference is the 
           */
                  GetBuilder<HomePageController>(
                      init: HomePageController(),
                      // New attribute "id"
                      id: "text1",
                      builder: (controller) {
                        return Text("value 1 -> ${controller.value1}");
                      }),
                  SizedBox(
                    height: 12,
                  ),
                  GetBuilder<HomePageController>(
                      id: 'text2',
                      init: HomePageController(),
                      builder: (controller) {
                        return Text("value 1 -> ${controller.value1}");
                      }),
                  ElevatedButton(
                      onPressed: () {
                        homePageController.increamentValue1();
                      },
                      child: Text("Increament value 1 "))
                ],
              )),
        ));
  }
}
