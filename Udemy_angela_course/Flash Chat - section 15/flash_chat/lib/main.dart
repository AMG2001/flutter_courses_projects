import 'package:flash_chat/config/pages_name/pages_name.dart';
import 'package:flash_chat/screens/chat_screen/chat_screen.dart';
import 'package:flash_chat/screens/login_screen/login_screen.dart';
import 'package:flash_chat/screens/registration_screen/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:flash_chat/screens/welcome_screen/welcome_screen.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(FlashChat());
}

class FlashChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Flash Chat",
      home: WelcomeScreen(),
      getPages: [
        /**
         * Welcome page
         */
        GetPage(
          name: PagesName.welcomePageName,
          page: () => WelcomeScreen(),
          transition: Transition.rightToLeft,
        ),
        /**
         * Register page
         */
        GetPage(
          name: PagesName.registrationPageName,
          page: () => RegistrationScreen(),
          transition: Transition.rightToLeft,
        ),
        /**
         * Login page
         */
        GetPage(
          name: PagesName.loginPageName,
          page: () => LoginScreen(),
          transition: Transition.leftToRight,
        ),
        /**
         * Chat page
         */
        GetPage(
          name: PagesName.chatPageName,
          page: () => ChatScreen(),
          transition: Transition.rightToLeft,
        ),
      ],
    );
  }
}
