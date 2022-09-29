import 'package:flutter/material.dart';

class RegisterPageHeader extends StatelessWidget {
  const RegisterPageHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Hero(
          tag: "logo",
          child: Container(
            height: 200.0,
            child: Image.asset('images/logo.png'),
          ),
        ),
        const SizedBox(
          height: 48.0,
        ),
      ],
    );
  }
}
