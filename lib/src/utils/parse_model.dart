import 'package:direct_link/direct_link.dart';

SiteModel parseModel(Map<String, dynamic> map) {
  var meta = map['meta'];
  var url = map['url'];

  var links = <Link>[];

  for (var i = 0; i < url.length; i++) {
    var data = url[i];
    links.add(
      Link(
        link: data['url'],
        type: data['type'],
        quality: data['quality'] ?? 'sd',
      ),
    );
  }

  return SiteModel(
    links: links,
    title: meta['title'],
    thumbnail: map['thumb'],
    duration: meta['duration'],
  );
}
