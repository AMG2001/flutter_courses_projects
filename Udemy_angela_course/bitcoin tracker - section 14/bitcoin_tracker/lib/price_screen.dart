import 'package:bitcoin_tracker/coin_data.dart';
import 'package:bitcoin_tracker/price_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PriceScreen extends StatelessWidget {
  @override
  String textOnDropDown = "Choose Currency";
  List<DropdownMenuItem<String>> dropDownMenuItems = [];
  @override
  Widget build(BuildContext context) {
    currenciesList.forEach((element) => dropDownMenuItems
        .add(DropdownMenuItem(child: Text(element), value: element)));
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: GetBuilder<PriceScreenController>(
          init: PriceScreenController(),
          builder: (controller) {
            controller.startWithEUR();
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
                  child: Card(
                    color: Colors.lightBlueAccent,
                    elevation: 5.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 15.0, horizontal: 28.0),
                      child: Text(
                        '1 BTC = ${controller.valueOfCryptoCoin} USD',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
                  child: Card(
                    color: Colors.lightBlueAccent,
                    elevation: 5.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 15.0, horizontal: 28.0),
                      child: Text(
                        '1 ETH = ${controller.valueOfCryptoCoin} USD',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
                  child: Card(
                    color: Colors.lightBlueAccent,
                    elevation: 5.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 15.0, horizontal: 28.0),
                      child: Text(
                        '1 LTC = ${controller.valueOfCryptoCoin} USD',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                Spacer(),
                Container(
                  height: 150.0,
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(bottom: 30.0),
                  color: Colors.lightBlue,
                  child: DropdownButton<String>(
                    hint: Text(controller.cryptoCoin),
                    items: dropDownMenuItems,
                    onChanged: (value) {
                      controller.changeCryptoCoin(value!);
                    },
                  ),
                ),
              ],
            );
          }),
    );
  }
}
