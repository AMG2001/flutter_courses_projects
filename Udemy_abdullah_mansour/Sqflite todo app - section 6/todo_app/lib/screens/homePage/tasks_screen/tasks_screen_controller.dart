import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:todo_app/services/database.dart';

class TasksScreenController extends GetxController {
  List<Map<String, dynamic>> tasks = [];

  Future<void> insertNewTask({
    required TextEditingController taskTitleController,
    required TextEditingController taskDateController,
    required TextEditingController taskTimeController,
  }) async {
    // TODO insert task into database
    await DatabaseClass.insertIntoDatabase(
        title: taskTitleController.text,
        date: taskDateController.text,
        time: taskTimeController.text,
        status: "not finished");
    await refreshTasksList();
    update();
  }

  Future<void> refreshTasksList() async {
    tasks = await DatabaseClass.showDatabaseRecordes();
  }

  Future<void> deleteTask({required int id}) async {
    await DatabaseClass.deleteTaskFormDatabase(id);
    await refreshTasksList();
    update();
  }
}
