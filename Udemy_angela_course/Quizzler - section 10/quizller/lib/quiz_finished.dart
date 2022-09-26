import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:quizller/questions_controller.dart';
import 'package:quizller/quiz_finished_controller.dart';

class QuizFinished extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<QuizFinishedController>(
          init: QuizFinishedController(),
          builder: (controller) {
            return Container(
              color: Colors.grey[700],
              width: Get.width,
              height: Get.height,
              child: Align(
                alignment: Alignment.center,
                child: AnimatedContainer(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.white,
                  ),
                  duration: Duration(milliseconds: 500),
                  width: controller.containerWidth + 16,
                  height: controller.containerHeight + 16,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Lottie.network(
                        "https://assets10.lottiefiles.com/private_files/lf30_wrglulvw.json",
                        height: controller.iconHeight - 16,
                        // repeat: false,
                      ),
                      controller.text,
                      controller.sizedBox,
                      controller.againButton
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
