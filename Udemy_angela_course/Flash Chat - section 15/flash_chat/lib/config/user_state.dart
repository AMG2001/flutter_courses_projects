import 'package:shared_preferences/shared_preferences.dart';

class UserState {
  static late SharedPreferences userLoggedInBool;
  static String loggedinKey = "logged";
  static Future<void> init() async {
    userLoggedInBool = await SharedPreferences.getInstance();
    if (userLoggedInBool.getBool(loggedinKey) == null) {
      await userLoggedInBool.setBool(loggedinKey, false);
      print("Value of shardPref = ${userLoggedInBool.getBool(loggedinKey)}");
    }
  }

  static bool getUserLoogedState() {
    return userLoggedInBool.getBool(loggedinKey)!;
  }

  static Future<void> userLoggedIn() async {
    await userLoggedInBool.setBool(loggedinKey, true);
  }

  static Future<void> userLoggedOut() async {
    await userLoggedInBool.setBool(loggedinKey, false);
  }
}
