import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat/config/pages_name/pages_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterPageRegisterButton extends StatelessWidget {
  FirebaseAuth auth;
  String email;
  String password;
  RegisterPageRegisterButton(
      {required this.auth, required this.email, required this.password});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        color: Colors.blueAccent,
        borderRadius: BorderRadius.all(Radius.circular(30.0)),
        elevation: 5.0,
        child: MaterialButton(
          onPressed: () async {
            try {
              /**
                       * Regsiter User
                       */
              await auth
                  .createUserWithEmailAndPassword(
                      email: email, password: password)
                  .then((value) => Get.offNamed(PagesName.chatPageName));
            } catch (e) {
              print(e);
            }
          },
          minWidth: 200.0,
          height: 42.0,
          child: const Text(
            'Register',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
