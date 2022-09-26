import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizller/main.dart';
import 'package:quizller/questions_controller.dart';

class QuizFinishedController extends GetxController {
  final questionsController = Get.put(QuestionsController(), permanent: true);

  QuizFinishedController() {
    changeContainerSize();
  }
  double containerWidth = Get.width * .5;

  double containerHeight = Get.height * .25;

  double iconHeight = Get.height * .25;

  bool changed = false;

  Text text = Text("");
  SizedBox sizedBox = SizedBox(
    height: 0,
  );
  Widget againButton = Text("");

  void changeContainerSize() async {
    await Future.delayed(
      Duration(seconds: 3),
      () {
        containerWidth = Get.width * .75;
        containerHeight = Get.height * .5;
        iconHeight = Get.height * .3;

        text = Text("Quiz finished");
        sizedBox = SizedBox(
          height: 16,
        );
        againButton = ElevatedButton(
            onPressed: () {
              questionsController.resetQuiz();
              Get.off(QuizPage());
            },
            child: Text("Solve Quiz again"));
        update();
      },
    );
  }
}
