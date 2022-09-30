import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoadingIndicatorController extends GetxController {
  BuildContext context;
  LoadingIndicatorController({required this.context});

  void showIndicator() async {
    await showDialog(
        context: context,
        builder: (context) {
          return Center(
            child: CircularProgressIndicator(color: Colors.white),
          );
        });
    update();
  }

  void removeIndicator() {
    Navigator.pop(context);
    update();
  }
}
