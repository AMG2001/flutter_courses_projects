import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizller/list_of_questions_and_answers_class.dart';
import 'package:quizller/quiz_finished.dart';

class QuestionsController extends GetxController {
  int indexOfQuestion = 0;
  List<QuestionsAndAnswers> listOfQuestionsAndAnswers = [
    QuestionsAndAnswers(question: "My name is mohamad", answer: true),
    QuestionsAndAnswers(question: "My name is mahmoud", answer: false),
  ];
  List<Icon> listOfIcons = [];

  void checkAsnwer(bool choice) {
    if (listOfQuestionsAndAnswers[indexOfQuestion].answer == choice) {
      listOfIcons.add(Icon(
        Icons.check,
        color: Colors.green,
        size: 14,
      ));
      if (indexOfQuestion < listOfQuestionsAndAnswers.length - 1) {
        indexOfQuestion++;
      } else {
        Get.off(QuizFinished());
      }
      // print("index after is : $indexOfQuestion");
      update();
    } else {
      listOfIcons.add(Icon(
        Icons.close,
        color: Colors.red,
        size: 14,
      ));

      if (indexOfQuestion < listOfQuestionsAndAnswers.length - 1) {
        indexOfQuestion++;
      } else {
        Get.off(QuizFinished());
      }
      update();
    }
  }

  void resetQuiz() {
    indexOfQuestion = 0;
    listOfIcons.clear();
  }
}
