part of direct_link;

class SiteModel {
  final String? title;
  final String? thumbnail;
  final String? duration;
  final List<Link>? links;

  SiteModel({
    required this.title,
    required this.thumbnail,
    required this.duration,
    required this.links,
  });
}

class Link {
  final String quality;
  final String link;
  final String? type;

  Link({
    required this.quality,
    required this.link,
    required this.type,
  });
}
