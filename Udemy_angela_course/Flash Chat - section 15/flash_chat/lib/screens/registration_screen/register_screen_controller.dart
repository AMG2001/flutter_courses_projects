import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class RegisterPageController extends GetxController {
  String email = "";
  String password = "";
  FirebaseAuth auth = FirebaseAuth.instance;

  void setEmail(String e) {
    email = e;
    update();
  }

  String get getEmail => email;

  void setPassword(String p) {
    password = p;
    update();
  }

  String get getPassword => password;

  FirebaseAuth get getFirebaseAuthInstance => auth;
}
