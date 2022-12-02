import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class TodoItem extends StatefulWidget {
  String taskTitle;
  bool state = false;

  TodoItem({required this.taskTitle});

  @override
  State<TodoItem> createState() => _TodoItemState();
}

class _TodoItemState extends State<TodoItem> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            SizedBox(width: 10.w),
            Text(
              widget.taskTitle,
              style: TextStyle(
                  fontSize: 16.sp,
                  decoration: widget.state == true
                      ? TextDecoration.lineThrough
                      : TextDecoration.none),
            ),
          ],
        ),
        Row(
          children: [
            Checkbox(
                activeColor: Colors.lightBlueAccent,
                checkColor: Colors.white,
                value: widget.state,
                onChanged: (newVal) {
                  setState(() {
                    widget.state = newVal!;
                  });
                }),
            SizedBox(
              width: 5.w,
            ),
          ],
        )
      ],
    );
  }
}
