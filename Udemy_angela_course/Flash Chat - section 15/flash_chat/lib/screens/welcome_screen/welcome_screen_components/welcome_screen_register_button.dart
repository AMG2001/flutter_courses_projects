import 'package:flash_chat/config/pages_name/pages_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class WelcomeScreenRegisterButton extends StatelessWidget {
  const WelcomeScreenRegisterButton({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Material(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.circular(30.0),
                elevation: 5.0,
                child: MaterialButton(
                  onPressed: () {
                    Get.toNamed(PagesName.registrationPageName);
                    //Go to registration screen.
                  },
                  minWidth: 200.0,
                  height: 42.0,
                  child: const Text(
                    'Register',
                  ),
                ),
              ),
            );
  }
}