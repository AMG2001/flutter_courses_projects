import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/screens/homePage/home_page.dart';
import 'package:todo_app/screens/homePage/tasks_screen/tasks_screen_controller.dart';
import 'package:todo_app/services/database.dart';

void main() async {
  final tasksScreenController = Get.put(TasksScreenController());
  WidgetsFlutterBinding.ensureInitialized();
  await DatabaseClass.createDatabase();
  tasksScreenController.tasks = await DatabaseClass.showDatabaseRecordes();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(debugShowCheckedModeBanner: false, home: HomePage());
  }
}
