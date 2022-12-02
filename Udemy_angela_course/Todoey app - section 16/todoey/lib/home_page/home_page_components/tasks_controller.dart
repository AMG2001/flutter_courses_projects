import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todoey/home_page/home_page_components/todo_item.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
class TasksController extends GetxController {
  List<Widget> tasksList = [
    SizedBox(
      height: 3.h,
    ),
    TodoItem(taskTitle: "But the Mild and Cookies"),
  ];

  void addNewTask(String task) {
    tasksList.add(TodoItem(taskTitle: task));
    update();
  }
}
