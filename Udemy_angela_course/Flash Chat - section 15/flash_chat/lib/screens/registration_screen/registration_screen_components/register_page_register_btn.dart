import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat/config/pages_name/pages_name.dart';
import 'package:flash_chat/screens/registration_screen/register_screen_controller.dart';
import 'package:flash_chat/utilities/loading_indicator_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterPageRegisterButton extends StatelessWidget {
  final registerPageController =
      Get.put(RegisterPageController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoadingIndicatorController>(
        init: LoadingIndicatorController(context: context),
        builder: (controller) {
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 16.0),
            child: Material(
              color: Colors.blueAccent,
              borderRadius: BorderRadius.all(Radius.circular(30.0)),
              elevation: 5.0,
              child: MaterialButton(
                onPressed: () async {
                  try {
                    print("email : ${registerPageController.getEmail}");
                    print("psasword : ${registerPageController.getPassword}");
                    controller.showIndicator();
                    print("Auth start !!");
                    /**
                           * Regsiter User
                           */
                    await registerPageController.getFirebaseAuthInstance
                        .createUserWithEmailAndPassword(
                            email: registerPageController.getEmail,
                            password: registerPageController.getPassword)
                        .then((value) {
                      controller.removeIndicator();
                      Get.delete<LoadingIndicatorController>();

                      print("user id is : ${value.user!.uid}");
                      Get.offNamed(PagesName.chatPageName);
                      Get.delete<RegisterPageController>();
                    });
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
        });
  }
}
