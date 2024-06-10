import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_tts/flutter_tts.dart';

class AudioPlayerPage extends StatefulWidget {
  final String text;

  AudioPlayerPage({required this.text});

  @override
  _AudioPlayerPageState createState() => _AudioPlayerPageState();
}

class _AudioPlayerPageState extends State<AudioPlayerPage> {
  late FlutterTts flutterTts;
  bool isPlaying = false;

  @override
  void initState() {
    super.initState();
    flutterTts = FlutterTts();
  }

  Future<void> _togglePlayback() async {
    if (isPlaying) {
      await flutterTts.stop();
    } else {
      await flutterTts.setLanguage("en-US");
      await flutterTts.setPitch(1.0);
      await flutterTts.speak(widget.text);
    }
    setState(() {
      isPlaying = !isPlaying;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Audio Player"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: Icon(isPlaying ? Icons.stop : Icons.play_arrow),
              onPressed: _togglePlayback,
            ),
            SizedBox(height: 20),
            Text(
              widget.text,
              textAlign: TextAlign.center,
              style: GoogleFonts.lato(
                textStyle: TextStyle(
                  fontWeight: FontWeight.w300,
                  color: Color.fromRGBO(66, 66, 86, 1),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
