import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class PriceScreenController extends GetxController {
  String cryptoCoin = "EUR";
  double numberOfCryptoCoin = 0;
  double valueOfCryptoCoin = 0;

  void changeCryptoCoin(String newCoin) {
    cryptoCoin = newCoin;
    update();
  }

  void startWithEUR() async {
    http.Response response = await http.get(Uri.parse(
        "https://rest.coinapi.io/v1/exchangerate/EUR/USD?apikey=3029F92F-5F95-41DB-88DE-1D6A80A6BA13"));
    var commingData = jsonDecode(response.body);
    valueOfCryptoCoin = commingData['rate'];
    print(valueOfCryptoCoin);
    update();
  }

  void convertCryptoToUSD(String crypto) {}
}
