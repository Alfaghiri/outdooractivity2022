class HikingData {
  final String imageurl;
  final String tittel;
  final String details;
  final String link;
  const HikingData({
    this.imageurl,
    this.tittel,
    this.details,
    this.link,
  });
  static HikingData fromJson(json) => HikingData(
      imageurl: json['imageurl'],
      tittel: json['tittel'],
      details: json['details'],
      link: json['link']);
}
