import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todoey/config/dimensions.dart';
import 'package:todoey/home_page/home_page_components/home_page_header.dart';
import 'package:todoey/home_page/home_page_components/main_white_container.dart';
import 'package:todoey/home_page/home_page_components/tasks_controller.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final formKey = GlobalKey<FormState>();
  TextEditingController taskController = TextEditingController();
  final tasksController = Get.put(TasksController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: OutlinedButton(
          style: ButtonStyle(
            side: MaterialStateProperty.all<BorderSide>(
                BorderSide(color: Colors.blueAccent, width: 1)),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ),
          onPressed: () {
            Get.bottomSheet(Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(24),
                  topLeft: Radius.circular(24),
                ),
              ),
              width: Dimensions.width,
              height: Dimensions.height * .25,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: Dimensions.height * .05,
                  ),
                  Text(
                    "Add Task",
                    style: TextStyle(color: Colors.blue[300], fontSize: 24),
                  ),
                  Form(
                    key: formKey,
                    child: Container(
                      width: Dimensions.width * .8,
                      child: TextFormField(
                        // key: formKey,
                        decoration: InputDecoration(
                            hintText: "Add your task",
                            suffixIcon: Icon(Icons.note_alt_outlined)),
                        controller: taskController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "you can't leave this field empty !!";
                          }
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: Dimensions.height * .02,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          tasksController.addNewTask(taskController.text);
                          Get.back();
                        }
                      },
                      child: Container(
                          alignment: Alignment.center,
                          width: Dimensions.width * .8,
                          child: Text("Add")))
                ],
              ),
            ));
          },
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Add new Task"),
              Icon(Icons.add),
            ],
          )),
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
