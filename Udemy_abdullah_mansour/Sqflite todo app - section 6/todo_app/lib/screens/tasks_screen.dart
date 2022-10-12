import 'package:flutter/material.dart';
import 'package:todo_app/screens/homePage/home_page_components/task_card.dart';
import 'package:todo_app/services/database.dart';

class TasksScreen extends StatelessWidget {
  List<Map<String, dynamic>> tasks = DatabaseClass.records;
  @override
  Widget build(BuildContext context) {
    print("Data inside tasks : ");
    print(tasks);
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(8),
        child: ListView.builder(
          itemCount: DatabaseClass.records.length,
          itemBuilder: ((context, index) {
            return TaskCard(
                taskTitle: tasks[index]["title"],
                taskDescription: tasks[index]["date"],
                taskTime: tasks[index]["time"]);
          }),
        ),
      ),
    );
  }
}

/*
ListTile(
        
          contentPadding: EdgeInsets.all(18),
          leading: CircleAvatar(
            radius: 30,
            child: Text(
              "02:00 AM",
              style: TextStyle(color: Colors.black, fontSize: 14),
            ),
          ),
          title: Text("Post title"),
          subtitle: Text("Post description"),
          trailing: 
        ),*/