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
