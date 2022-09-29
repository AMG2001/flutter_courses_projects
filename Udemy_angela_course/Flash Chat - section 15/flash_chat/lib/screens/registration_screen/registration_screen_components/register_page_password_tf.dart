import 'package:flutter/material.dart';

class RegisterPagePasswordTF extends StatelessWidget {
  String password;
  RegisterPagePasswordTF({required this.password});

  @override
  Widget build(BuildContext context) {
    return /**
             * Password Text Field
             */
        TextField(
      style: const TextStyle(color: Colors.black),
      onChanged: (value) {
        password = value;
      },
      decoration: const InputDecoration(
        hintText: 'Enter your password',
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
