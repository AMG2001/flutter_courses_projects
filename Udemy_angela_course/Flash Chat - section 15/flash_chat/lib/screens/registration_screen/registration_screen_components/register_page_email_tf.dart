import 'package:flutter/material.dart';

class RegisterPageEmailTF extends StatelessWidget {
  String email;
  RegisterPageEmailTF({required this.email});

  @override
  Widget build(BuildContext context) {
    return /**
             * Email Text Field
             */
        TextField(
      style: TextStyle(color: Colors.black),
      onChanged: (value) {
        email = value;
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
