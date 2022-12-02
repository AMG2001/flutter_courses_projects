import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizller/list_of_questions_and_answers_class.dart';
import 'package:quizller/quiz_finished.dart';

class QuestionsController extends GetxController {
  int indexOfQuestion = 0;
  List<QuestionsAndAnswers> listOfQuestionsAndAnswers = [
    QuestionsAndAnswers(
        question: 'Some cats are actually allergic to humans', answer: true),
    QuestionsAndAnswers(
        question: 'You can lead a cow down stairs but not up stairs.',
        answer: false),
    QuestionsAndAnswers(
        question: 'Approximately one quarter of human bones are in the feet.',
        answer: true),
    QuestionsAndAnswers(question: 'A slug\'s blood is green.', answer: true),
    QuestionsAndAnswers(
        question: 'Buzz Aldrin\'s mother\'s maiden name was \"Moon\".',
        answer: true),
    QuestionsAndAnswers(
        question: 'It is illegal to pee in the Ocean in Portugal.',
        answer: true),
    QuestionsAndAnswers(
        question:
            'No piece of square dry paper can be folded in half more than 7 times.',
        answer: false),
    QuestionsAndAnswers(
        question:
            'In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.',
        answer: true),
    QuestionsAndAnswers(
        question:
            'The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.',
        answer: false),
    QuestionsAndAnswers(
        question:
            'The total surface area of two human lungs is approximately 70 square metres.',
        answer: true),
    QuestionsAndAnswers(
        question: 'Google was originally called \"Backrub\".', answer: true),
    QuestionsAndAnswers(
        question:
            'Chocolate affects a dog\'s heart and nervous system; a few ounces are enough to kill a small dog.',
        answer: true),
    QuestionsAndAnswers(
        question:
            'In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.',
        answer: true),
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
        resetQuiz();
        Get.to(QuizFinished());
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
        resetQuiz();
        Get.to(QuizFinished());
      }
      update();
    }
  }

  void resetQuiz() {
    indexOfQuestion = 0;
    listOfIcons.clear();
  }
}
