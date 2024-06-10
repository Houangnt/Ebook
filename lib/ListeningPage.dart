import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_tts/flutter_tts.dart'; // Import the TTS package

class ListeningPage extends StatefulWidget {
  final String imageAddress;
  final String bookname;
  final String authorname;

  ListeningPage({
    required this.authorname,
    required this.bookname,
    required this.imageAddress,
  });

  @override
  _ListeningPageState createState() => _ListeningPageState();
}

class _ListeningPageState extends State<ListeningPage> {
  bool played = true;
  IconData play = Icons.pause;
  FlutterTts flutterTts = FlutterTts(); // Initialize the TTS instance
  double currentPos = 0.0; // Current position of the speech

  void playIcon() {
    setState(() {
      played ? play = Icons.pause : play = Icons.play_arrow;
    });
  }

  Future<void> _speak(String text) async {
    await flutterTts.setLanguage("en-US");
    await flutterTts.setPitch(1.0);
    await flutterTts.speak(text);
  }

  void _pause() {
    setState(() {
      played = false;
      playIcon();
      flutterTts.stop();
    });
  }

  @override
  void initState() {
    super.initState();
    play = Icons.pause;
    played = true;
  }

  @override
  void dispose() {
    flutterTts.stop(); // Stop the TTS when the widget is disposed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color.fromRGBO(249, 191, 161, 1), Colors.white],
                begin: Alignment.topCenter,
                end: Alignment.center,
              ),
            ),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.01),
                  height: size.height * 0.085,
                  width: size.width,
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () => Navigator.pop(context),
                            child: Container(
                              padding: EdgeInsets.all(constraints.maxHeight * 0.18),
                              height: constraints.maxHeight * 0.8,
                              width: constraints.maxWidth * 0.15,
                              child: FittedBox(
                                child: Icon(
                                  Icons.arrow_back_ios,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            height: constraints.maxHeight * 0.85,
                            width: constraints.maxWidth * 0.51,
                            child: Column(
                              children: [
                                Container(
                                  height: constraints.maxHeight * 0.85 * 0.7,
                                  width: constraints.maxWidth * 0.35,
                                  child: FittedBox(
                                    child: Text(
                                      widget.bookname,
                                      style: GoogleFonts.lato(
                                        textStyle: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  height: constraints.maxHeight * 0.85 * 0.3,
                                  width: constraints.maxWidth * 0.35,
                                  child: FittedBox(
                                    child: Text(
                                      "Chapter 2",
                                      style: GoogleFonts.lato(
                                        textStyle: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(constraints.maxHeight * 0.18),
                            height: constraints.maxHeight * 0.8,
                            width: constraints.maxWidth * 0.15,
                            child: FittedBox(
                              child: Icon(Icons.share, color: Colors.white),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: size.height * 0.05,
                ),
                Hero(
                  tag: Text("Haha"),
                  child: Container(
                    height: size.height * 0.4,
                    width: size.width * 0.68,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(size.width * 0.05),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(widget.imageAddress),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromRGBO(203, 201, 208, 1),
                          blurRadius: 10,
                          spreadRadius: 0.6,
                          offset: Offset(size.width * 0.55 * 0.051,
                              size.height * 0.4 * 0.031),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.045,
                ),
                Container(
                  width: size.width * 0.9,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(size.height * 0.005),
                    color: Color.fromRGBO(235, 235, 237, 1),
                  ),
                  height: size.height * 0.01,
                  child: Stack(
                    children: [
                      Container(
                        width: size.width * 0.9 * (173 / 230),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(size.height * 0.005),
                          color: Color.fromRGBO(69, 69, 88, 1),
                        ),
                        height: size.height * 0.01,
                      )
                    ],
                  ),
                ),
                SizedBox(height: size.height * 0.005),
                Container(
                  height: size.height * 0.015,
                  width: size.width * 0.9,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: size.height * 0.015,
                        width: size.width * 0.1,
                        child: FittedBox(
                          child: Text(
                            "17:13",
                            style: GoogleFonts.lato(),
                          ),
                        ),
                      ),
                      Container(
                        height: size.height * 0.015,
                        width: size.width * 0.1,
                        child: FittedBox(
                          child: Text(
                            "24:56",
                            style: GoogleFonts.lato(),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
                  height: size.height * 0.12,
                  width: size.width * 0.9,
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Material(
                            color: Colors.white,
                            child: InkWell(
                              onTap: () {},
                              borderRadius: BorderRadius.circular(
                                constraints.maxHeight * 0.1,
                              ),
                              child: Container(
                                height: constraints.maxHeight * 0.6,
                                width: constraints.maxWidth * 0.2,
                                child: FittedBox(
                                  child: Icon(
                                    Icons.fast_rewind,
                                    color: Color.fromRGBO(69, 69, 88, 1),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Material(
                            color: Colors.white,
                            child: InkWell(
                              onTap: () {
                                if (played) {
                                  _pause();
                                } else {
                                  setState(() {
                                    played = true;
                                    playIcon();
                                    _speak("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras fermentum lectus lacus, in cursus sem volutpat non. Sed nisi ex, vestibulum quis lobortis et, scelerisque hendrerit velit. Maecenas convallis volutpat quam a luctus. Morbi metus massa, cursus in arcu et, dapibus iaculis odio. Quisque suscipit, erat ac ornare iaculis, nibh sapien semper dui, imperdiet cursus turpis libero ut justo. Duis in tincidunt neque, eu iaculis nulla. In lorem dolor, porttitor hendrerit dui feugiat, convallis tincidunt lectus. Nullam auctor, lorem ut consectetur dictum, quam mauris eleifend arcu, eu fermentum urna neque sit amet ante. Maecenas libero felis, consectetur at metus eu, vestibulum sollicitudin erat. Nullam euismod sapien eu dui mollis, vel imperdiet urna commodo. Maecenas semper elementum magna, eu commodo quam finibus non. Mauris condimentum nisl leo, quis dignissim augue gravida et. Pellentesque tincidunt vitae erat nec interdum. Praesent a dui sagittis, luctus metus nec, accumsan eros. Sed quis scelerisque velit, ut ultrices tellus. Praesent dignissim lacus a lectus suscipit sagittis. Aliquam luctus nibh at consectetur rutrum. Proin congue mauris elementum varius placerat. Pellentesque vulputate ante eu nunc placerat, eu egestas elit ornare. Nullam ac ipsum ultrices ante venenatis faucibus vehicula quis risus. Vestibulum ut turpis quis sapien dictum mattis eget iaculis nisl. In porttitor felis eu metus eleifend pulvinar. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus tristique nulla sed felis sollicitudin consequat.");
                                  });
                                }
                              },
                              borderRadius: BorderRadius.circular(
                                constraints.maxHeight * 0.1,
                              ),
                              child: Container(
                                height: constraints.maxHeight * 0.8,
                                width: constraints.maxWidth * 0.25,
                                child: FittedBox(
                                  child: Icon(
                                    play,
                                    color: Color.fromRGBO(69, 69, 88, 1),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Material(
                            color: Colors.white,
                            child: InkWell(
                              onTap: () {},
                              borderRadius: BorderRadius.circular(
                                constraints.maxHeight * 0.1,
                              ),
                              child: Container(
                                height: constraints.maxHeight * 0.6,
                                width: constraints.maxWidth * 0.2,
                                child: FittedBox(
                                  child: Icon(
                                    Icons.fast_forward,
                                    color: Color.fromRGBO(69, 69, 88, 1),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: size.height * 0.03,
                ),
                Container(
                  height: size.height * 0.1,
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Material(
                            borderRadius: BorderRadius.circular(
                              constraints.maxHeight * 0.45,
                            ),
                            child: InkWell(
                              onTap: () {},
                              borderRadius: BorderRadius.circular(
                                constraints.maxHeight * 0.45 / 2,
                              ),
                              child: Container(
                                height: constraints.maxHeight * 0.45,
                                width: constraints.maxWidth * 0.9 / 5,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                    constraints.maxHeight * 0.45 / 2,
                                  ),
                                ),
                                child: FittedBox(
                                  child: Icon(
                                    Icons.book,
                                    color: Color.fromRGBO(69, 69, 88, 1),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Material(
                            borderRadius: BorderRadius.circular(
                              constraints.maxHeight * 0.45,
                            ),
                            child: InkWell(
                              onTap: () {},
                              borderRadius: BorderRadius.circular(
                                constraints.maxHeight * 0.45 / 2,
                              ),
                              child: Container(
                                height: constraints.maxHeight * 0.45,
                                width: constraints.maxWidth * 0.9 / 5,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                    constraints.maxHeight * 0.45 / 2,
                                  ),
                                ),
                                child: FittedBox(
                                  child: Icon(
                                    Icons.text_format,
                                    color: Color.fromRGBO(69, 69, 88, 1),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Material(
                            borderRadius: BorderRadius.circular(
                              constraints.maxHeight * 0.45,
                            ),
                            child: InkWell(
                              onTap: () {},
                              borderRadius: BorderRadius.circular(
                                constraints.maxHeight * 0.45 / 2,
                              ),
                              child: Container(
                                height: constraints.maxHeight * 0.45,
                                width: constraints.maxWidth * 0.9 / 5,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                    constraints.maxHeight * 0.45 / 2,
                                  ),
                                ),
                                child: FittedBox(
                                  child: Icon(
                                    Icons.list,
                                    color: Color.fromRGBO(69, 69, 88, 1),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Material(
                            borderRadius: BorderRadius.circular(
                              constraints.maxHeight * 0.45,
                            ),
                            child: InkWell(
                              onTap: () {},
                              borderRadius: BorderRadius.circular(
                                constraints.maxHeight * 0.45 / 2,
                              ),
                              child: Container(
                                height: constraints.maxHeight * 0.45,
                                width: constraints.maxWidth * 0.9 / 5,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                    constraints.maxHeight * 0.45 / 2,
                                  ),
                                ),
                                child: FittedBox(
                                  child: Icon(
                                    Icons.brightness_3,
                                    color: Color.fromRGBO(191, 191, 191, 1),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Material(
                            borderRadius: BorderRadius.circular(
                              constraints.maxHeight * 0.45,
                            ),
                            child: InkWell(
                              onTap: () {},
                              borderRadius: BorderRadius.circular(
                                constraints.maxHeight * 0.45 / 2,
                              ),
                              child: Container(
                                height: constraints.maxHeight * 0.45,
                                width: constraints.maxWidth * 0.9 / 5,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                    constraints.maxHeight * 0.45 / 2,
                                  ),
                                ),
                                child: FittedBox(
                                  child: Icon(
                                    Icons.headset,
                                    color: Color.fromRGBO(191, 191, 191, 1),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}