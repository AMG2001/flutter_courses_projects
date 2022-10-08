import 'package:get/get.dart';

class HomePageController extends GetxController {
  int value1 = 0;
  int value2 = 0;

  void increamentValue1() {
    /**
     * Ui of both text will be updated to 10 if the value1 become 9
     * else , text1 builder will alone updated
     */
    if (value1 == 9) {
      update(['text1', 'text2']);
      value1++;
    } else {
      update(['text1']);
      value1++;
    }
  }
}
