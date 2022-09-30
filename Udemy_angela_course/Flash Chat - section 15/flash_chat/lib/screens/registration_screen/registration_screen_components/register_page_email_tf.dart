import 'package:flash_chat/screens/registration_screen/register_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterPageEmailTF extends StatelessWidget {
  final controller = Get.put(RegisterPageController(), permanent: true);
  @override
  Widget build(BuildContext context) {
    return /**
             * Email Text Field
             */
        TextField(
      style: TextStyle(color: Colors.black),
      onChanged: (value) {
        controller.setEmail(value);
      },
      decoration: const InputDecoration(
        hintText: 'Enter your email',
        contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blueAccent, width: 1.0),
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blueAccent, width: 2.0),
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
        ),
      ),
    );
  }
}
