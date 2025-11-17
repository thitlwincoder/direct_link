class SiteModel {
  final String? title;
  final String? thumbnail;
  final String? duration;
  final List<Link>? links;

  SiteModel({this.title, this.thumbnail, this.duration, this.links});

  Map<String, dynamic> toJson() => {
    'title': title,
    'thumbnail': thumbnail,
    'duration': duration,
    'links': links?.map((x) => x.toJson()).toList(),
  };
}

class Link {
  final String quality;
  final String link;
  final String? type;

  Link({required this.quality, required this.link, required this.type});

  Map<String, dynamic> toJson() => {
    'quality': quality,
    'link': link,
    'type': type,
  };
}
