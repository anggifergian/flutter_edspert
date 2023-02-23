class Banner {
  String? eventId;
  String? eventTitle;
  String? eventDescription;
  String? eventImage;
  String? eventUrl;

  Banner({this.eventId, this.eventTitle, this.eventDescription, this.eventImage, this.eventUrl});

  factory Banner.fromJson(Map<String, dynamic> json) {
    return Banner(
        eventId: json['event_id'],
        eventTitle: json['event_title'],
        eventDescription: json['event_description'],
        eventImage: json['event_image'],
        eventUrl: json['event_url']);
  }
}

class BannerListResponse {
  int? status;
  String? message;
  List<Banner>? data;

  BannerListResponse({this.status, this.message, this.data});

  BannerListResponse.fromJson(Map json) {
    status = json['status'];
    message = json['message'];

    if (json['data'] != null) {
      data = [];
      json['data'].forEach((item) {
        data!.add(Banner.fromJson(item));
      });
    }
  }
}
