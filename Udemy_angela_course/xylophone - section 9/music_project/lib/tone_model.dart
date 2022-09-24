import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';

class ToneModel extends StatelessWidget {
  late String tonePath;
  late Color buttonColor;
  ToneModel({required this.tonePath, required this.buttonColor});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await AssetsAudioPlayer.newPlayer().open(
          Audio(tonePath),
          autoStart: true,
          showNotification: true,
        );
      },
      child: Container(
        color: buttonColor,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * .15,
      ),
    );
  }
}
