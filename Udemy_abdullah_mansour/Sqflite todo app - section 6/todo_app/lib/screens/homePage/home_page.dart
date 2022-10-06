import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/screens/archived_screen.dart';
import 'package:todo_app/screens/done_screen.dart';
import 'package:todo_app/screens/homePage/home_page_components/date_picker_text_field.dart';
import 'package:todo_app/screens/homePage/home_page_components/grey_shift_slider.dart';
import 'package:todo_app/screens/homePage/home_page_components/task_title_text_field.dart';
import 'package:todo_app/screens/homePage/home_page_components/time_picker_text_field.dart';
import 'package:todo_app/screens/tasks_screen.dart';
import 'package:todo_app/services/database.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> _screens = [TasksScreen(), DoneScreen(), ArchivedScreen()];
  List<String> _screenTitle = ["New Tasks", "Done Tasks", "Archived Tasks"];
  int _currentIndex = 0;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _taskTitleController = TextEditingController();
  TextEditingController _taskTimeController = TextEditingController();
  TextEditingController _taskDateController = TextEditingController();
  @override
  void initState() {
    DatabaseClass.createDatabase();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /**
       * ************************************ Body **************************************
       */
      body: _screens[_currentIndex],
      /**
       * ********************************** AppBar **************************************
       */
      appBar: AppBar(
        title: Text(_screenTitle[_currentIndex]),
      ),
      /**
       * ********************************** FAB ****************************************
       */
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.bottomSheet(
              Padding(
                // padding in bottom with the height of the keyboard
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(28),
                      topLeft: Radius.circular(28),
                    ),
                  ),
                  width: Get.width,
                  height: Get.height * .55,
                  child: Form(
                    key: _formKey,
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
                            controller: _taskTitleController,
                            prefixIcon: Icon(Icons.title_outlined),
                            title: "Task Title",
                            width: Get.width),
                        /**
                 * Task Time TF
                 */
                        TimePickerTextField(
                            taskTimeController: _taskTimeController,
                            textFieldWidth: Get.width,
                            labelText: "Task Time",
                            icon: Icon(Icons.access_alarm_outlined)),

                        /**
                 *  Task Date TF
                 */
                        DatePickerTextField(
                            taskDateController: _taskDateController,
                            labelText: "Task Date",
                            prefixIcon: Icon(Icons.date_range_outlined),
                            textFieldWidth: Get.width),
                        SizedBox(
                          height: 12,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ElevatedButton(
                                style: ButtonStyle(
                                  textStyle:
                                      MaterialStateProperty.all<TextStyle>(
                                          TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500)),
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.red),
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
                            ElevatedButton(
                                style: ButtonStyle(
                                  textStyle:
                                      MaterialStateProperty.all<TextStyle>(
                                          TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500)),
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.purple),
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(24),
                                    ),
                                  ),
                                ),
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    // TODO insert task into database
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
                                )),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              isScrollControlled: true);
        },
        child: const Icon(Icons.add),
      ),
      /**
       * ******************************* Bottom Navigation Bar **************************
       */
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.list), label: "Tasks"),
          BottomNavigationBarItem(
              icon: Icon(Icons.done_all_outlined), label: "Done"),
          BottomNavigationBarItem(
              icon: Icon(Icons.archive_outlined), label: "Archived"),
        ],
        onTap: (newIndex) {
          setState(() {
            _currentIndex = newIndex;
          });
        },
      ),
    );
  }
}

/**
 *   await DatabaseClass.insertIntoDatabase(
              title: "First task",
              date:  DateFormat.yMMMMd('en_US').format(DateTime.now()),
              time: DateFormat.jm().format(DateTime.now()),
              status: "Not finished");
          await DatabaseClass.showDatabase();
 */
