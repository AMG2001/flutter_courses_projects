import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizller/dimensions.dart';
import 'package:quizller/main.dart';
import 'package:quizller/questions_controller.dart';

class QuizFinishedController extends GetxController {
  final questionsController = Get.put(QuestionsController(), permanent: true);

  QuizFinishedController() {
    changeContainerSize();
  }
  double containerWidth = Dimensions.width * .5;

  double containerHeight = Dimensions.height * .25;

  double iconHeight = Dimensions.height * .25;

  bool changed = false;

  Text text = Text("");
  SizedBox sizedBox = SizedBox(
    height: 0,
  );
  Widget againButton = Text("");

  void changeContainerSize() async {
    await Future.delayed(
      Duration(seconds: 1),
      () {
        containerWidth = Dimensions.width * .75;
        containerHeight = Dimensions.height * .5;
        iconHeight = Dimensions.height * .3;

        text = Text("Quiz finished");
        sizedBox = SizedBox(
          height: 16,
        );
        againButton = ElevatedButton(
            onPressed: () {
                 Get.back();
              questionsController.resetQuiz();
            },
            child: Text("Solve Quiz again"));
        update();
      },
    );
  }
}
