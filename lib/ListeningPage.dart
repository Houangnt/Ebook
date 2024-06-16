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
    await flutterTts.setLanguage("vi-VN");
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
  played = false; 
  playIcon();
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
                              padding: EdgeInsets.all(constraints.maxHeight * 0.05),
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
                                  height: constraints.maxHeight * 0.85 * 0.1,
                                  width: constraints.maxWidth * 0.35,
                                  child: FittedBox(
                                    child: Text(
                                      "",
                                      style: GoogleFonts.roboto(
                                        textStyle: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  height: constraints.maxHeight * 0.85 * 0.9,
                                  width: constraints.maxWidth * 0.9,
                                  child: FittedBox(
                                    child: Text(
                                      "Phó thủ tướng yêu cầu có kịch bản giá điện trong tháng 6",
                                      style: GoogleFonts.roboto(
                                        textStyle: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
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
                            style: GoogleFonts.roboto(),
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
                                    _speak("Phó thủ tướng yêu cầu các bộ ngành đề xuất thời điểm, mức độ điều chỉnh giá điện, dịch vụ y tế, giáo dục trong tháng 6.Đầu năm, Bộ Công Thương kiến nghị điều chỉnh giá điện trong năm nay, để phản ánh biến động các chi phí đầu vào và giúp Tập đoàn Điện lực Việt Nam (EVN) có nguồn lực thanh toán cho chủ đầu tư các nhà máy điện. Tuy nhiên, Bộ Công Thương hiện chưa đề xuất phương án giá cụ thể, theo báo cáo từ Bộ Tài chính.Tại cuộc họp Ban chỉ đạo điều hành giá ngày 12/6, Phó thủ tướng Lê Minh Khái yêu cầu Bộ Công Thương lên kịch bản, trong đó đề xuất thời điểm, mức độ điều chỉnh giá điện trong tháng 6. Ngoài giá điện, ông cũng yêu cầu ngành giáo dục, y tế có kịch bản điều hành các mặt hàng trong tháng này.Hạn chót 30/6 phải có kịch bản để Ban Chỉ đạo điều hành giá cân nhắc, cho ý kiến, Phó thủ tướng nói, thêm rằng nếu không đảm bảo thời gian, để tác động đến CPI, các bộ ngành phải chịu trách nhiệm. Đầu tháng 2, Thủ tướng Phạm Minh Chính từng lưu ý các cơ quan có lộ trình điều chỉnh giá điện phù hợp thị trường, không giật cục, nóng vội. Tinh thần là giá điện cạnh tranh nhưng phải có sự điều tiết của Nhà nước, Thủ tướng nói.Song, điện vốn là mặt hàng đặc biệt, được sử dụng nhiều, ảnh hưởng lớn tới đời sống và sản xuất, kinh doanh. Mặt khác, TS. Nguyễn Bích Lâm, nguyên Tổng cục trưởng Tổng cục Thống kê (GSO) từng ước tính, giá năng lượng tăng 8% có thể làm CPI thêm 0,4-0,5% (trực tiếp và gián tiếp). Vì thế, giới chuyên gia cho rằng việc tăng giá mặt hàng này cần được tính toán và có lộ trình phù hợp về mức độ, thời điểm. Điều này đảm bảo tính thị trường, giảm lỗ cho EVN nhưng phải đảm bảo mục tiêu kiểm soát lạm phát. Từ 15/5, cơ chế điều chỉnh giá bán lẻ điện thực hiện theo Quyết định 05/2024. Theo đó, giá điện được xét thay đổi ba tháng một lần khi chi phí đầu vào tăng từ 3% trở lên. Gần nhất, giá điện tăng 4,5% vào tháng 11/2023. Năm nay, Việt Nam đặt mục tiêu kiểm soát CPI bình quân cả năm ở mức 4-4,5%. Bộ Tài chính và Tổng cục Thống kê ước lạm phát bình quân năm nay tăng khoảng 3,72-4,5%, nằm trong giới hạn đặt ra. Còn Ngân hàng Nhà nước dự báo con số này có thể lên 4,6%, nếu nhiều yếu tố bất lợi cùng xảy ra.Ngoài giá điện, tại cuộc họp, Thứ trưởng Tài chính Lê Tấn Cận cho rằng dịch vụ giáo dục, y tế cũng là yếu tố gây áp lực lên mặt bằng giá do tới kỳ điều chỉnh theo lộ trình. Cùng đó, vé máy bay trong nước cũng chịu áp lực điều chỉnh từ thế giới. Chi phí logistics, phụ thu hàng hóa container tại cảng biển tăng mạnh... cũng gây áp lực đến chi phí của doanh nghiệp. Ngược lại, lạm phát toàn cầu có thể hạ nhiệt trong năm 2024 giúp Việt Nam bớt áp lực từ kênh nhập khẩu lạm phát. Để kiểm soát, Phó thủ tướng Lê Minh Khái đề nghị các bộ ngành, địa phương không chủ quan trong điều hành, vì áp lực lạm phát thời gian tới rất lớn. Các bộ phải theo sát tình hình kinh tế, biến động địa chính trị để có kịch bản ứng phó. Ông cũng yêu cầu các cơ quan quản lý đảm bảo cung ứng, lưu thông hàng hóa, dịch vụ, nhất là xăng dầu và các mặt hàng chiến lược có khả năng bị ảnh hưởng từ sự đứt gãy chuỗi cung ứng toàn cầu và xung đột địa chính trị.");
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