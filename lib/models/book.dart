class Book {
  final String title;
  final String subtitle;
  final String isbn13;
  final String price;
  final String image;
  final String url;

  Book(
      this.title, this.subtitle, this.isbn13, this.price, this.image, this.url);

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(json['title'], json['subtitle'], json['isbn13'], json['price'],
        json['image'], json['url']);
  }
}

class BookListResponse {
  String? error;
  String? total;
  List<Book>? books;

  BookListResponse(this.error, this.total, this.books);

  BookListResponse.fromJson(Map json) {
    error = json['error'];
    total = json['total'];

    if (json['books'] != null) {
      books = <Book>[];
      json['books'].forEach((item) {
        books!.add(Book.fromJson(item));
      });
    }
  }
}

class BookDetail {
  final String error;
  final String title;
  final String subtitle;
  final String authors;
  final String publisher;
  final String isbn10;
  final String isbn13;
  final String pages;
  final String year;
  final String rating;
  final String desc;
  final String price;
  final String image;
  final String url;

  BookDetail(
      this.error,
      this.title,
      this.subtitle,
      this.authors,
      this.publisher,
      this.isbn10,
      this.isbn13,
      this.pages,
      this.year,
      this.rating,
      this.desc,
      this.price,
      this.image,
      this.url);

  factory BookDetail.fromJson(Map json) {
    return BookDetail(
        json['error'],
        json['title'],
        json['subtitle'],
        json['authors'],
        json['publisher'],
        json['isbn10'],
        json['isbn13'],
        json['pages'],
        json['year'],
        json['rating'],
        json['desc'],
        json['price'],
        json['image'],
        json['url']);
  }
}
