import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:music_project/tone_model.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Music_App"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ToneModel(tonePath: "assets/note1.wav", buttonColor: Colors.orange),
            ToneModel(tonePath: "assets/note2.wav", buttonColor: Colors.red),
            ToneModel(tonePath: "assets/note3.wav", buttonColor: Colors.purple),
            ToneModel(tonePath: "assets/note4.wav", buttonColor: Colors.yellow),
            ToneModel(tonePath: "assets/note5.wav", buttonColor: Colors.green),
            ToneModel(tonePath: "assets/note6.wav", buttonColor: Colors.black),
          ],
        ),
      ),
    );
  }
}
