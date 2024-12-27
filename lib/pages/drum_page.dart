import 'package:audioplayers/audioplayers.dart';
import 'package:drump/services/audio_recorder.dart';
import 'package:flutter/material.dart';
//import 'package:google_fonts/google_fonts.dart';

class DrumPage extends StatefulWidget {
  const DrumPage({super.key});

  @override
  State<DrumPage> createState() => _DrumPageState();
}

class _DrumPageState extends State<DrumPage> {
  final audioPlayer = AudioPlayer();

  void playFunction(String musicAdi) {
    audioPlayer.play(
      AssetSource("$musicAdi.wav"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  buildDrumButton('kick', Colors.yellow),
                  buildDrumButton('snare', Colors.yellow),
                  buildDrumButton('hat1', Colors.yellow),
                  buildDrumButton('hat2', Colors.yellow),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  buildDrumButton('tom', Colors.orangeAccent),
                  buildDrumButton('rides', Colors.orangeAccent),
                  buildDrumButton('uzi', Colors.orangeAccent),
                  buildDrumButton('trappy', Colors.orangeAccent),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  buildDrumButton('voc E', Colors.red),
                  buildDrumButton('voc D', Colors.red),
                  buildDrumButton('voc Fm', Colors.red),
                  buildDrumButton('voc C', Colors.red)
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  buildDrumButton('rim', Colors.pink),
                  buildDrumButton('rimC', Colors.pink),
                  buildDrumButton('stab C', Colors.pink),
                  buildDrumButton('synth Em', Colors.pink),
                ],
              ),
            ),
            Expanded(
              child: AudioRecorder(),
            ),
          ],
        ),
      ),
      //bottomNavigationBar: const BottomFlashyTabBar(),
    );
  }
  
  Widget buildDrumButton(String melodi, Color renk) {
    return Expanded(
      child: TextButton(
        onPressed: () {
          playFunction(melodi);
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: renk,
          ),
          
          alignment: Alignment.center,
          child: Text(
            melodi,
            /*style: GoogleFonts.sedgwickAveDisplay(
              color: Colors.black,
              fontSize: 30,
            ),*/
          ),
        ),
      ),
    );
  }
}
