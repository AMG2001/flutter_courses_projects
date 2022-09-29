import 'package:flash_chat/config/pages_name/pages_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WelcomeScreenLoginButton extends StatelessWidget {
  const WelcomeScreenLoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 5.0,
        color: Colors.lightBlueAccent,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: () {
            Get.toNamed(PagesName.loginPageName);
            //Go to login screen.
          },
          minWidth: 200.0,
          height: 42.0,
          child: const Text(
            'Log In',
          ),
        ),
      ),
    );
  }
}
