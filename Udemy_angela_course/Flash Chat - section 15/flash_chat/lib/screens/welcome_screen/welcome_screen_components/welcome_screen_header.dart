import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class WelcomeScreenHeader extends StatelessWidget {
  const WelcomeScreenHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: <Widget>[
            /**
                 * Hero Animation in welcome screen "widget : Page1()"
                 */
            Hero(
              tag: "logo",
              child: Container(
                child: Image.asset('images/logo.png'),
                height: 60.0,
              ),
            ),
            AnimatedTextKit(
              animatedTexts: [
                TypewriterAnimatedText(
                  speed: Duration(milliseconds: 250),
                  'Flash Chat',
                  textStyle: const TextStyle(
                    fontSize: 45.0,
                    color: Colors.black,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(
          height: 48.0,
        ),
      ],
    );
  }
}
