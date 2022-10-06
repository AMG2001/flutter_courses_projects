import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/screens/archived_screen.dart';
import 'package:todo_app/screens/done_screen.dart';
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
        onPressed: () async {
          await DatabaseClass.insertIntoDatabase(
              title: "First task",
              date:  DateFormat.yMMMMd('en_US').format(DateTime.now()),
              time: DateFormat.jm().format(DateTime.now()),
              status: "Not finished");
          await DatabaseClass.showDatabase();
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
