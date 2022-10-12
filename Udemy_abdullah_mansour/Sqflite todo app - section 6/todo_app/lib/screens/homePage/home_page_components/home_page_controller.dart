import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:todo_app/screens/homePage/home_page_components/date_picker_text_field.dart';
import 'package:todo_app/screens/homePage/home_page_components/grey_shift_slider.dart';
import 'package:todo_app/screens/homePage/home_page_components/task_title_text_field.dart';
import 'package:todo_app/screens/homePage/home_page_components/time_picker_text_field.dart';
import 'package:todo_app/services/database.dart';

class HomePageController extends GetxController {
  BuildContext context;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController taskTitleController = TextEditingController();
  TextEditingController taskTimeController = TextEditingController();
  TextEditingController taskDateController = TextEditingController();
  // List<Task> list = [];
  HomePageController({required this.context});

  /**
   * When you want to ad new task , show bottom sheet and enter your new task
   */
  void showBottomSheet() {
    Get.bottomSheet(
        Padding(
          // padding in bottom with the height of the keyboard
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(28),
                topLeft: Radius.circular(28),
              ),
            ),
            width: Get.width,
            height: Get.height * .56,
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  /**
                   * top space 
                   */
                  SizedBox(
                    height: 16,
                  ),
                  /**
                   * Slide gray shift 
                   */
                  GreyShiftSlider(),
                  /**
                   * Space between slide shift and post Title TF
                   */
                  SizedBox(
                    height: 24,
                  ),
                  /**
                   * Task Title TF
                   */
                  TaskTitleTextField(
                      controller: taskTitleController,
                      prefixIcon: Icon(Icons.title_outlined),
                      title: "Task Title",
                      width: Get.width),
                  /**
                 * Task Time TF
                 */
                  TimePickerTextField(
                      taskTimeController: taskTimeController,
                      textFieldWidth: Get.width,
                      labelText: "Task Time",
                      icon: Icon(Icons.access_alarm_outlined)),

                  /**
                 *  Task Date TF
                 */
                  DatePickerTextField(
                      taskDateController: taskDateController,
                      labelText: "Task Date",
                      prefixIcon: Icon(Icons.date_range_outlined),
                      textFieldWidth: Get.width),
                  SizedBox(
                    height: 12,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      /**
                             * "Cancel" - Back Button
                             */
                      ElevatedButton(
                          style: ButtonStyle(
                            textStyle: MaterialStateProperty.all<TextStyle>(
                                TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w500)),
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.red),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(24),
                              ),
                            ),
                          ),
                          onPressed: () {
                            Get.back();
                          },
                          child: Row(
                            children: [
                              Text("Cancel"),
                              SizedBox(
                                width: 8,
                              ),
                              Icon(Icons.cancel_outlined)
                            ],
                          )),
                      /**
                             * Save Button
                             */
                      ElevatedButton(
                        style: ButtonStyle(
                          textStyle: MaterialStateProperty.all<TextStyle>(
                              TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500)),
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.purple),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24),
                            ),
                          ),
                        ),
                        onPressed: () async {
                          if (formKey.currentState!.validate()) {
                            // TODO insert task into database
                            await DatabaseClass.insertIntoDatabase(
                                title: taskTitleController.text,
                                date: taskDateController.text,
                                time: taskTimeController.text,
                                status: "not finished");

                            taskTitleController.clear();
                            taskTimeController.clear();
                            taskDateController.clear();
                            Get.back();
                            await DatabaseClass.showDatabaseRecordes();
/**
 * after process finished , show Success Animation .
 */
                            showDialog(
                                context: context,
                                builder: (context) {
                                  Future.delayed(Duration(milliseconds: 1500),
                                      () {
                                    Navigator.pop(context);
                                  });
                                  return Center(
                                    child: Lottie.asset('assets/success.json',
                                        repeat: false),
                                  );
                                });
                          }
                        },
                        child: Row(
                          children: [
                            Text("Add Task"),
                            SizedBox(
                              width: 8,
                            ),
                            Icon(Icons.done_all_outlined)
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
        isScrollControlled: true);
  }
}
