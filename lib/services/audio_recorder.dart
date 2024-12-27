import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'dart:io';

import 'package:permission_handler/permission_handler.dart';

class AudioRecorder extends StatefulWidget {
  const AudioRecorder({super.key});

  @override
  State<AudioRecorder> createState() => _AudioRecorderState();
}

class _AudioRecorderState extends State<AudioRecorder> {
  bool isRecording = false;
  final FlutterSoundRecorder _recorder = FlutterSoundRecorder();
  String? recordingFilePath;

  @override
  void initState() {
    super.initState();
    _initializeRecorder();
  }

  Future<void> _initializeRecorder() async {
    // Request permissions
    await Permission.microphone.request();
    await Permission.storage.request();

    // Open the audio session
    await _recorder.openRecorder();
  }
  Future<void> _startRecording() async {
    recordingFilePath = await getRecordingFilePath();
    var file = File(recordingFilePath!);
    await file.create();
    await _recorder.startRecorder(
      toFile: file.path,
      codec: Codec.pcm16WAV,
    );
    print("Recording started: $recordingFilePath");
  }
  Future<void> _stopRecording() async {
    await _recorder.stopRecorder();
    print("Recording stopped: $recordingFilePath");
  }

  String getFormattedDate() {
  final now = DateTime.now();
  return "${now.year}-${now.month}-${now.day}_${now.hour}-${now.minute}-${now.second}";
  }

  Future<String> getRecordingFilePath() async {
    final directory = await getApplicationDocumentsDirectory();
    final fileName = "Recording_${getFormattedDate()}.wav"; // Use date-based name
    return "${directory.path}/$fileName";
  }

  void toggleRecording() async {
    if (isRecording) {
      // Stop recording logic
      _stopRecording();
      setState(() {
        isRecording = false;
      });
    } else {
      // Start recording logic
      //recordingFilePath = await getRecordingFilePath();
      //var file = File(recordingFilePath!);
      //await file.create();
      _startRecording();
      setState(() {
        isRecording = true;
      });
      // Example of using the file path (e.g., starting the recorder)
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Recorder widget at the bottom
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              color: Colors.grey.shade800,
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    isRecording ? "Recording..." : "Press to record",
                    style: TextStyle(
                      color: isRecording ? Colors.red : Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  ElevatedButton.icon(
                    onPressed: toggleRecording,
                    icon: Icon(isRecording ? Icons.stop : Icons.mic),
                    label: Text(isRecording ? "Stop" : "Record"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: isRecording ? Colors.red : Colors.blue,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}