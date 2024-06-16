class Booksdata {
  String bookname;
  String authorName;
  String imagePath;
  int percentageCompleted;
  double rating;

  Booksdata({
    required this.bookname, // Making bookname required
    this.authorName = '',
    this.percentageCompleted = 0,
    this.imagePath = '',
    this.rating = 0.0,
  });
}



List<Booksdata> continueReading = [
  Booksdata(
      bookname: "Hàng loạt kỷ lục được thiết lập trong trận Đức thắng Scotland 5-1",
      authorName: "Thể thao",
      percentageCompleted: 64,
      imagePath: 'assets/images/chienthangduc.jpeg'),
  Booksdata(
      bookname: "Phó thủ tướng yêu cầu có kịch bản giá điện trong tháng 6",
      authorName: "Kinh doanh",
      percentageCompleted: 16,
      imagePath: 'assets/images/phothutuong.jpeg'),
  Booksdata(
      bookname: "Khám phá khu rừng thủy tùng lớn nhất thế giới",
      authorName: "Khoa học",
      percentageCompleted: 44,
      imagePath: 'assets/images/rungthuytung.jpeg'),
];

List<Booksdata> popular = [
  Booksdata(
      bookname: "Đường đê Âu Cơ trước ngày khánh thành",
      authorName: "Thời sự",
      percentageCompleted: 0,
      imagePath: 'assets/images/DuongDeAuCo.jpeg',
      rating: 4.5
      ),

  Booksdata(
      bookname: "Giá cát mua từ Campuchia đắt hơn trong nước 57%",
      authorName: "Thời sự",
      percentageCompleted: 0,
      imagePath: 'assets/images/dongbang.jpeg',
      rating: 4.3
      ),
  Booksdata(
      bookname: "Bộ trưởng Nguyễn Văn Thắng bác tin 'lúa chết do dùng cát biển làm cao tốc",
      authorName: "Thời sự",
      percentageCompleted: 0,
      imagePath: 'assets/images/lua.jpeg',
      rating: 4.0
      ),
      
];
