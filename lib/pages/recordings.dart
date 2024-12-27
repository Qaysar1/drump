import 'package:flutter/material.dart';

class Recordings extends StatefulWidget {
  const Recordings({super.key});

  @override
  State<Recordings> createState() => _RecordingsState();
}

class _RecordingsState extends State<Recordings> {
  bool isPlaying = false;
  List<bool> isPlayingList = List.generate(10, (index) => false);
  void togglePlayPause(int index) {
    setState(() {
      isPlayingList[index] = !isPlayingList[index];
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: isPlayingList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () => togglePlayPause(index),
              child: Container(
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.blue.shade300,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Icon(
                      isPlayingList[index] ? Icons.pause : Icons.play_arrow,
                      size: 50,
                      color: Colors.white,
                    ),
                    Positioned(
                      bottom: 10,
                      child: Text(
                        isPlayingList[index] ? "Pause" : "Play",
                        style: const TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                    Positioned(
                      top: 10,
                      left: 10,
                      child: Text(
                        "Tile ${index + 1}",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}