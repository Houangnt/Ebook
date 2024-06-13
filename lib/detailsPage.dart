import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:alan_voice/alan_voice.dart';
import 'ReadingPage.dart';
import 'ListeningPage.dart';
import 'package:flutter_tts/flutter_tts.dart'; // Import the TTS package

class DetailsPage extends StatefulWidget {
  final String imageAddress;
  final String bookname;
  final String authorname;

  DetailsPage({
    required this.authorname,
    required this.bookname,
    required this.imageAddress,
  });

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
    @override
  void initState() {
    super.initState();

    AlanVoice.addButton(
      "1038c7f749b4e6f9c0929e7c6282af902e956eca572e1d8b807a3e2338fdd0dc/stage",
      buttonAlign: AlanVoice.BUTTON_ALIGN_LEFT,
    );

    AlanVoice.onCommand.add((command) => _handleVoiceCommand(command.data));
  }

  @override
  void dispose() {
    AlanVoice.onCommand.clear();
    super.dispose();
  }

  void _handleVoiceCommand(Map<String, dynamic> command) {
        switch (command["command"]) {
          case "listen book":
            _navigateToListeningPage();
            _playBook();
            break;
          case "stop reading book":
              _stopPlay();
            break;
          case "read book":
            _navigateToReadingPage();
            break;
          case "back home":
              _navigateBackToDetailsPage();
            break;
          default:
            print("Unknown command");
            break;
        }
  }


  void _navigateToListeningPage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ListeningPage(
          authorname: widget.authorname,
          bookname: widget.bookname,
          imageAddress: widget.imageAddress,
        ),
      ),
    );
  }

  void _navigateToReadingPage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ReadingPage(
          bookname: widget.bookname,
          authorname: widget.authorname,
          imageAddress: widget.imageAddress,
        ),
      ),
    );
  }
  void _navigateBackToDetailsPage() {
    Navigator.popUntil(context, (route) => route.isFirst);
  }
  FlutterTts flutterTts = FlutterTts(); // Initialize the TTS instance

  Future<void> _speak(String text) async {
    await flutterTts.setLanguage("vi-VN");
    await flutterTts.setPitch(1.0);
    await flutterTts.speak(text);
  }
  void _stopPlay(){
      setState(() {
        flutterTts.stop();
    });
  }
  void _playBook() {
      setState(() {
        _speak("Harry Potter là một loạt tiểu thuyết huyền bí gồm bảy phần của nhà văn Anh Quốc J. K. Rowling. Bộ truyện viết về những cuộc phiêu lưu phù thủy của cậu bé Harry Potter cùng hai người bạn thân là Ron Weasley và Hermione Granger, lấy bối cảnh tại Trường Phù thủy và Pháp sư Hogwarts ở nước Anh. Những cuộc phiêu lưu tập trung vào cuộc chiến của Harry Potter trong việc chống lại tên Chúa tể Hắc ám Voldemort – người có tham vọng muốn trở nên bất tử, thống trị thế giới phù thủy, nô dịch hóa những người phi pháp thuật và tiêu diệt những ai cản đường hắn, đặc biệt là Harry Potter.");
      });
  }
                            
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      //backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
              //color: Colors.red,
              gradient: LinearGradient(
                colors: [Color.fromRGBO(249, 191, 161, 1), Colors.white],
                begin: Alignment.topCenter,
                end: Alignment.center,
                //,stops: [0.7,0.9]
              ),
            ),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.01),
                  height: size.height * 0.085,
                  width: size.width,
                  //color: Colors.red,
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Material(
                            color: Colors.white.withOpacity(0),
                            child: InkWell(
                              onTap: () => Navigator.pop(context),
                              borderRadius: BorderRadius.circular(
                                  constraints.maxHeight * 0.4),
                              splashColor: Colors.white,
                              child: Container(
                                padding: EdgeInsets.all(
                                    constraints.maxHeight * 0.18),
                                //color: Colors.black,
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
                          ),
                          SizedBox(
                            width: constraints.maxWidth * 0.54,
                          ),
                          Container(
                            padding: EdgeInsets.all(
                                constraints.maxHeight * 0.18),
                            //color: Colors.black,
                            height: constraints.maxHeight * 0.8,
                            width: constraints.maxWidth * 0.15,
                            child: FittedBox(
                              child: Icon(
                                Icons.share,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(
                                constraints.maxHeight * 0.18),
                            //color: Colors.black,
                            height: constraints.maxHeight * 0.8,
                            width: constraints.maxWidth * 0.15,
                            child: FittedBox(
                              child: Icon(
                                Icons.bookmark_border,
                                color: Colors.white,
                              ),
                            ),
                          )
                        ],
                      );
                    },
                  ),
                ),
                Hero(
                  tag: Text("Haha"),
                  child: Container(
                    height: size.height * 0.4,
                    width: size.width * 0.55,
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        return Stack(
                          children: [
                            Positioned(
                              bottom: constraints.maxWidth * 0.04,
                              left: constraints.maxWidth * 0.05,
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: constraints.maxHeight * 0.015),
                                decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(1),
                                    borderRadius: BorderRadius.circular(
                                        constraints.maxHeight * 0.04)),
                                height: constraints.maxHeight * 0.12,
                                width: constraints.maxWidth * 0.25,
                                child: FittedBox(
                                  child: Text(
                                    "⭐ " + 4.5.toString(),
                                    style: GoogleFonts.roboto(
                                        textStyle: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                  ),
                                ),
                              ),
                            )
                          ],
                        );
                      },
                    ),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(size.width * 0.05),
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage(widget.imageAddress),
                      ),
                      boxShadow: [
                        BoxShadow(
                            color: Color.fromRGBO(203, 201, 208, 1),
                            blurRadius: 10,
                            spreadRadius: 0.6,
                            offset: Offset(size.width * 0.55 * 0.051,
                                size.height * 0.4 * 0.031))
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.025,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.33),
                  height: size.height * 0.06,
                  width: size.width,
                  //color: Colors.red,
                  child: FittedBox(
                    child: Text(
                      widget.bookname,
                      style: GoogleFonts.roboto(
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(66, 66, 86, 1)),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: size.width * 0.33, vertical: size.width * 0.009),
                  height: size.height * 0.03,
                  width: size.width,
                  //color: Colors.red,
                  child: FittedBox(
                    child: Text(
                      widget.authorname,
                      style: GoogleFonts.roboto(
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(142, 142, 154, 1)),
                    ),
                  ),
                ),
                Container(
                  height: size.height * 0.07,
                  width: size.width,
                  //color: Colors.red,
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            //color: Colors.purple,
                            width: constraints.maxWidth * 0.27,
                            child: LayoutBuilder(
                              builder: (context, constraints) {
                                return Column(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(
                                          constraints.maxHeight * 0.1),
                                      //color: Colors.grey,
                                      height: constraints.maxHeight * 0.6,
                                      width: constraints.maxWidth,
                                      child: FittedBox(
                                        child: Text(
                                          "2010",
                                          style: GoogleFonts.roboto(
                                              textStyle: TextStyle(
                                                  color: Color.fromRGBO(
                                                          66, 66, 86, 1)
                                                      .withOpacity(0.9),
                                                  fontWeight: FontWeight.bold)),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      //color: Colors.pink,
                                      padding: EdgeInsets.symmetric(
                                          horizontal: constraints.maxHeight * 0.1),
                                      height: constraints.maxHeight * 0.4,
                                      width: constraints.maxWidth,
                                      child: FittedBox(
                                        fit: BoxFit.scaleDown,
                                        child: Text(
                                          "Published in",
                                          style: GoogleFonts.roboto(
                                              textStyle: TextStyle(
                                                  fontSize: 20,
                                                  color: Color.fromRGBO(
                                                      142, 142, 154, 1),
                                                  fontWeight: FontWeight.w300)),
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ),
                          ),
                          Container(
                            color: Color.fromRGBO(203, 201, 208, 1),
                            width: constraints.maxWidth * 0.0031,
                            height: constraints.maxHeight,
                          ),
                          Container(
                            //color: Colors.purple,
                            width: constraints.maxWidth * 0.27,
                            child: LayoutBuilder(
                              builder: (context, constraints) {
                                return Column(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(
                                          constraints.maxHeight * 0.1),
                                      //color: Colors.grey,
                                      height: constraints.maxHeight * 0.6,
                                      width: constraints.maxWidth,
                                      child: FittedBox(
                                        child: Text(
                                          "156",
                                          style: GoogleFonts.roboto(
                                              textStyle: TextStyle(
                                                  color: Color.fromRGBO(
                                                          66, 66, 86, 1)
                                                      .withOpacity(0.9),
                                                  fontWeight: FontWeight.bold)),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      //color: Colors.pink,
                                      height: constraints.maxHeight * 0.4,
                                      width: constraints.maxWidth,
                                      child: FittedBox(
                                        fit: BoxFit.scaleDown,
                                        child: Text(
                                          "Pages",
                                          style: GoogleFonts.roboto(
                                              textStyle: TextStyle(
                                                  fontSize: 20,
                                                  color: Color.fromRGBO(
                                                      142, 142, 154, 1),
                                                  fontWeight: FontWeight.w300)),
                                        )),
                                    ),
                                  ],
                                );
                              },
                            ),
                          ),
                          Container(
                            color: Color.fromRGBO(203, 201, 208, 1),
                            width: constraints.maxWidth * 0.0031,
                            height: constraints.maxHeight,
                          ),
                          Container(
                            //color: Colors.purple,
                            width: constraints.maxWidth * 0.27,
                            child: LayoutBuilder(
                              builder: (context, constraints) {
                                return Column(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(
                                          constraints.maxHeight * 0.1),
                                      //color: Colors.grey,
                                      height: constraints.maxHeight * 0.6,
                                      width: constraints.maxWidth,
                                      child: FittedBox(
                                        child: Text(
                                          "187",
                                          style: GoogleFonts.roboto(
                                              textStyle: TextStyle(
                                                  color: Color.fromRGBO(
                                                          66, 66, 86, 1)
                                                      .withOpacity(0.9),
                                                  fontWeight: FontWeight.bold)),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      //color: Colors.pink,
                                      height: constraints.maxHeight * 0.4,
                                      width: constraints.maxWidth,
                                      child: FittedBox(
                                        fit: BoxFit.scaleDown,
                                        child: Text(
                                          "Reviews",
                                          style: GoogleFonts.roboto(
                                              textStyle: TextStyle(
                                                  fontSize: 20,
                                                  color: Color.fromRGBO(
                                                      142, 142, 154, 1),
                                                  fontWeight: FontWeight.w300)),
                                        )),
                                    ),
                                  ],
                                );
                              },
                            ),
                          )
                        ],
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                Container(
                  //color: Colors.red,
                  height: size.height * 0.04,
                  width: size.width,
                  child: FittedBox(
                    child: Text(
                      "About",
                      style: GoogleFonts.roboto(
                          textStyle: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Color.fromRGBO(66, 66, 86, 1),
                      )),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(size.height * 0.01),
                  //color: Colors.red,
                  height: size.height * 0.17,
                  width: size.width,
                  child: Center(
                    child: Text(
                      "Harry Potter là một loạt tiểu thuyết huyền bí gồm bảy phần của nhà văn Anh Quốc J. K. Rowling. Bộ truyện viết về những cuộc phiêu lưu phù thủy của cậu bé Harry Potter cùng hai người bạn thân là Ron Weasley và Hermione Granger.",
                      overflow: TextOverflow.fade,
                      style: GoogleFonts.roboto(
                          textStyle: TextStyle(
                        fontWeight: FontWeight.w300,
                        color: Color.fromRGBO(66, 66, 86, 1),
                      )),
                    ),
                  ),
                ),
                Container(
                  //padding: EdgeInsets.all(size.height * 0.01),
                  //color: Colors.red,
                  height: size.height * 0.071,
                  width: size.width,
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ReadingPage(
                                      bookname: widget.bookname,
                                      authorname: widget.authorname,
                                      imageAddress: widget.imageAddress,
                                    ),
                                  ));
                            },
                            child: Container(
                              //padding: EdgeInsets.all(constraints.maxHeight * 0.15),
                              height: constraints.maxHeight * 0.7,
                              width: constraints.maxWidth * 0.35,
                              child: LayoutBuilder(
                                builder: (context, constraints) {
                                  return Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        //color: Colors.red,
                                        height: constraints.maxHeight * 0.6,
                                        width: constraints.maxWidth * 0.2,
                                        child: FittedBox(
                                          child: Icon(
                                            Icons.book,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        //color: Colors.purple,
                                        height: constraints.maxHeight * 0.6,
                                        width: constraints.maxWidth * 0.45,
                                        child: FittedBox(
                                          child: Text("Đọc",
                                              style: GoogleFonts.roboto(
                                                  textStyle: TextStyle(
                                                      fontWeight: FontWeight.w400,
                                                      color: Colors.white))),
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              ),
                              decoration: BoxDecoration(
                                  color: Color.fromRGBO(66, 66, 86, 1),
                                  borderRadius: BorderRadius.circular(
                                      constraints.maxWidth * 0.03)),
                            ),
                          ),
                          Container(
                            //padding: EdgeInsets.all(constraints.maxHeight * 0.15),
                            height: constraints.maxHeight * 0.7,
                            width: constraints.maxWidth * 0.35,
                            child: LayoutBuilder(
                              builder: (context, constraints) {
                                return Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      //color: Colors.red,
                                      height: constraints.maxHeight * 0.6,
                                      width: constraints.maxWidth * 0.2,
                                      child: FittedBox(
                                        child: Icon(
                                          Icons.headset,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () => Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                ListeningPage(
                                              authorname: widget.authorname,
                                              bookname: widget.bookname,
                                              imageAddress: widget.imageAddress,
                                            ),
                                          )),
                                      child: Container(
                                        //color: Colors.purple,
                                        height: constraints.maxHeight * 0.6,
                                        width: constraints.maxWidth * 0.45,
                                        child: FittedBox(
                                          child: Text("Nghe",
                                              style: GoogleFonts.roboto(
                                                  textStyle: TextStyle(
                                                      fontWeight: FontWeight.w400,
                                                      color: Colors.white))),
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ),
                            decoration: BoxDecoration(
                                color: Color.fromRGBO(66, 66, 86, 1),
                                borderRadius: BorderRadius.circular(
                                    constraints.maxWidth * 0.03)),
                          ),
                        ],
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
