import 'package:flutter/material.dart';
import 'price_screen.dart';
// API Key : 3029F92F-5F95-41DB-88DE-1D6A80A6BA13
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
          primaryColor: Colors.lightBlue,
          scaffoldBackgroundColor: Colors.white),
      home: PriceScreen(),
    );
  }
}
