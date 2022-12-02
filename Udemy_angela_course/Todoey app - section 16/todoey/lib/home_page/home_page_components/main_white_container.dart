import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todoey/config/dimensions.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:todoey/home_page/home_page_components/tasks_controller.dart';
import 'package:todoey/home_page/home_page_components/todo_item.dart';

class MainWhiteContainer extends StatelessWidget {
  const MainWhiteContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: Dimensions.width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
        ),
        child: GetBuilder<TasksController>(
            init: TasksController(),
            builder: (controller) {
              return ListView(children: controller.tasksList);
            }),
      ),
    );
  }
}
