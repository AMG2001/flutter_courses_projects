import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat/config/pages_name/pages_name.dart';
import 'package:flash_chat/screens/registration_screen/registration_screen_components/register_page_email_tf.dart';
import 'package:flash_chat/screens/registration_screen/registration_screen_components/register_page_header.dart';
import 'package:flash_chat/screens/registration_screen/registration_screen_components/register_page_password_tf.dart';
import 'package:flash_chat/screens/registration_screen/registration_screen_components/register_page_register_btn.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _auth = FirebaseAuth.instance;
  late String email;
  late String password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            RegisterPageHeader(),
            RegisterPageEmailTF(email: email),
            const SizedBox(
              height: 8.0,
            ),
            RegisterPagePasswordTF(password: password),
            const SizedBox(
              height: 24.0,
            ),
            /***
             * Register User Button .
             */
            RegisterPageRegisterButton(
              auth: _auth,
              email: email,
              password: password,
            )
          ],
        ),
      ),
    );
  }
}

