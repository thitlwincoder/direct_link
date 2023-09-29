part of direct_link;

class SiteModel {
  final String quality;
  final String link;
  final String? type;

  SiteModel({
    required this.quality,
    required this.link,
    this.type,
  });
}
