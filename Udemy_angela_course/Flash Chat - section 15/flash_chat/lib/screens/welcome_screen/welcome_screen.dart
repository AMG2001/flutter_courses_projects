import 'package:flash_chat/screens/welcome_screen/welcome_screen_components/welcome_screen_header.dart';
import 'package:flash_chat/screens/welcome_screen/welcome_screen_components/welcome_screen_login_button.dart';
import 'package:flash_chat/screens/welcome_screen/welcome_screen_components/welcome_screen_register_button.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: const <Widget>[
            WelcomeScreenHeader(),
            WelcomeScreenLoginButton(),
            WelcomeScreenRegisterButton(),
          ],
        ),
      ),
    );
  }
}
