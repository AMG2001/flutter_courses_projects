import 'package:flutter/material.dart';

void main() {
  runApp(Todoey());
}


class Todoey extends StatelessWidget {
  const Todoey({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      
    );
  }
}
