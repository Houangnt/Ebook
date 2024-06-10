import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ReadingPage extends StatefulWidget {
  final String imageAddress;
  final String bookname;
  final String authorname;

  ReadingPage({
    required this.authorname,
    required this.bookname,
    required this.imageAddress,
  });

  @override
  _ReadingPageState createState() => _ReadingPageState();
}

class _ReadingPageState extends State<ReadingPage> {
  String text = "Ông bà Dursley, nhà số 4 đường Privet Drive, tự hào mà nói họ hoàn toàn bình thường, cám ơn bà con quan tâm. Bà con đừng trông mong gì họ tin vào những chuyện kỳ lạ hay bí ẩn, đơn giản là vì họ chẳng hơi đâu bận tâm đến mấy trò vớ vẩn đó.Ông Dursley là giám đốc một công ty gọi là Grunnings, chuyên sản suất máy khoan. Ông là một người cao lớn lực lưỡng, cổ gần như không có, nhưng lại có một bộ ria mép vĩ đại. Bà Dursley thì ốm nhom, tóc vàng, với một cái cổ dài gấp đôi bình thường, rất tiện cho bà nhóng qua hàng rào để dòm ngó nhà hàng xóm. Hai ông bà Dursley có một cậu quý tử tên là Dudley, mà theo ý họ thì không thể có đứa bé nào trên đời này ngoan hơn được nữa.Gia đình Dursley có mọi thứ mà họ muốn, nhưng họ cũng có một bí mật, và nỗi sợ hãi lớn nhất của họ là cái bí mật đó bị ai đó bật mí. Họ sợ mình sẽ khó mà chịu đựng nổi nếu câu chuyện về gia đình Potter bị người ta khám phá. Bà Potter là em gái của bà Dursley, nhưng nhiều năm rồi họ chẳng hề gặp gỡ nhau. Bà Dursley lại còn giả đò như mình không có chị em nào hết, bởi vì cô em cùng ông chồng vô tích sự của cô ta chẳng thể nào có được phong cách của gia đình Dursley.Ông bà Dursley vẫn rùng mình ớn lạnh mỗi khi nghĩ đến chuyện hàng xóm sẽ nói gì nếu thấy gia đình Potter xuất hiện trước cửa nhà mình. Họ biết gia đình Potter có một đứa con trai nhỏ, nhưng họ cũng chưa từng nhìn thấy nó. Đứa bé đó cũng là một lý do khiến họ tránh xa gia đình Potter: Họ không muốn cậu quý tử Dudley chung chạ với một thằng con nít nhà Potter.Vào một buổi sáng thứ ba xám xịt âm u, ông bà Dursley thức dậy, chẳng hề cảm thấy chút gì rằng bầu trời đầy mây kia đang báo hiệu những điều lạ lùng bí ẩn sắp xảy ra trên cả nước Anh. Ông Dursley ậm ừ khi chọn cái cà-vạt chán nhất thế giới đeo vào cổ đi làm. Bà Dursley thì lách chách nói trong lúc vật lộn với cậu quý tử Dudley đang gào khóc vùng vẫy, không chịu ngồi ăn sáng tử tế. Không một ai để ý đến một con cú to và đen thui bay xẹt qua cửa sổ.";

  final apiUrl = 'https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-flash-latest:generateContent?key=AIzaSyBxAD3w8Sj177gLUqdgqHL_XS8iix1YHLM';
  final headers = {
    'Content-Type': 'application/json',
  };

  Future<void> summarizeText() async {
    var data = {
      "contents": [
        {
          "parts": [
            {
              'text': text
            }
          ]
        }
      ],
    };

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: headers,
        body: json.encode(data),
      );

      if (response.statusCode == 200) {
        var result = json.decode(response.body);
        setState(() {
          text = result['candidates'][0]['content']['parts'][0]['text'];
        });
      } else {
        print('Failed to summarize text: ${response.statusCode}');
        print('Response body: ${response.body}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
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
                                  color: Color.fromRGBO(66, 66, 86, 1),
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
                                      style: GoogleFonts.roboto(
                                        textStyle: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Color.fromRGBO(66, 66, 86, 1),
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
                                      style: GoogleFonts.roboto(
                                        textStyle: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Color.fromRGBO(142, 142, 154, 1),
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
                              child: Icon(
                                Icons.share,
                                color: Color.fromRGBO(66, 66, 86, 1),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(size.height * 0.01),
                  height: size.height * 0.7,
                  width: size.width,
                  child: Center(
                    child: Text(
                      text,
                      overflow: TextOverflow.fade,
                      style: GoogleFonts.roboto(
                        textStyle: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Color.fromRGBO(101, 101, 101, 1),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(235, 235, 237, 1),
                    borderRadius: BorderRadius.circular(size.height * 0.006),
                  ),
                  height: size.height * 0.012,
                  width: size.width * 0.93,
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(69, 69, 88, 1),
                          borderRadius: BorderRadius.circular(size.height * 0.006),
                        ),
                        height: size.height * 0.012,
                        width: size.width * 0.93 * (173 / 230),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: size.height * 0.015,
                ),
                Container(
                  height: size.height * 0.025,
                  child: Center(
                    child: Text(
                      "173 of 230",
                      style: GoogleFonts.roboto(
                        textStyle: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Color.fromRGBO(101, 101, 101, 1).withOpacity(0.7),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                Container(
                  height: size.height * 0.1,
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Material(
                            borderRadius: BorderRadius.circular(constraints.maxHeight * 0.45),
                            child: InkWell(
                              onTap: () {},
                              borderRadius: BorderRadius.circular(constraints.maxHeight * 0.45 / 2),
                              child: Container(
                                height: constraints.maxHeight * 0.45,
                                width: constraints.maxWidth * 0.9 / 5,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(constraints.maxHeight * 0.45 / 2),
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
                            borderRadius: BorderRadius.circular(constraints.maxHeight * 0.45),
                            child: InkWell(
                              onTap: summarizeText,
                              borderRadius: BorderRadius.circular(constraints.maxHeight * 0.45 / 2),
                              child: Container(
                                height: constraints.maxHeight * 0.45,
                                width: constraints.maxWidth * 0.9 / 5,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(constraints.maxHeight * 0.45 / 2),
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
                            borderRadius: BorderRadius.circular(constraints.maxHeight * 0.45),
                            child: InkWell(
                              onTap: () {},
                              borderRadius: BorderRadius.circular(constraints.maxHeight * 0.45 / 2),
                              child: Container(
                                height: constraints.maxHeight * 0.45,
                                width: constraints.maxWidth * 0.9 / 5,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(constraints.maxHeight * 0.45 / 2),
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
                            borderRadius: BorderRadius.circular(constraints.maxHeight * 0.45),
                            child: InkWell(
                              onTap: () {},
                              borderRadius: BorderRadius.circular(constraints.maxHeight * 0.45 / 2),
                              child: Container(
                                height: constraints.maxHeight * 0.45,
                                width: constraints.maxWidth * 0.9 / 5,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(constraints.maxHeight * 0.45 / 2),
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
                            borderRadius: BorderRadius.circular(constraints.maxHeight * 0.45),
                            child: InkWell(
                              onTap: () {},
                              borderRadius: BorderRadius.circular(constraints.maxHeight * 0.45 / 2),
                              child: Container(
                                height: constraints.maxHeight * 0.45,
                                width: constraints.maxWidth * 0.9 / 5,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(constraints.maxHeight * 0.45 / 2),
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
