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
      bookname: "Wings of Fire",
      authorName: "APJ Abdul Kalam",
      percentageCompleted: 64,
      imagePath: 'assets/images/APJ.jpg'),
  Booksdata(
      bookname: "Phó thủ tướng yêu cầu có kịch bản giá điện trong tháng 6",
      authorName: "Kinh doanh",
      percentageCompleted: 16,
      imagePath: 'assets/images/phothutuong.jpeg'),
  Booksdata(
      bookname: "Harry Potter",
      authorName: "J.K Rowling",
      percentageCompleted: 44,
      imagePath: 'assets/images/HarryPotter.jpeg'),
];

List<Booksdata> popular = [
  Booksdata(
      bookname: "This is How It Always Is",
      authorName: "Laurie Frankel",
      percentageCompleted: 0,
      imagePath: 'assets/images/ThisisHow.jpeg',
      rating: 4.5
      ),

  Booksdata(
      bookname: "In A Land Of Paper Gods",
      authorName: "Rebecca Mackenzie",
      percentageCompleted: 0,
      imagePath: 'assets/images/rebbeca.jpg',
      rating: 4.3
      ),
  Booksdata(
      bookname: "The Guest List",
      authorName: "Lucy Foley",
      percentageCompleted: 0,
      imagePath: 'assets/images/theguest.jpeg',
      rating: 4.0
      ),
      
];
