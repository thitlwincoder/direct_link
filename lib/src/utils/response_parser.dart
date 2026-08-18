import 'package:direct_link/src/models/site_model.dart';
import 'package:html/dom.dart';
import 'package:html/parser.dart';

/// Parses SaveFrom response HTML into a [SiteModel].
SiteModel? parseResponseData(String? content) {
  if (content == null || content.isEmpty) return null;

  final body = parse(content);
  final result = body.querySelector('#sf_result');
  if (result != null) return _parseResult(result);

  final info = body.querySelector('.info-box');
  final links = _parseLinks(
    info?.querySelectorAll('.link-group a') ?? const [],
  );

  if (links.isEmpty) {
    final single = body.querySelector('.def-btn-box a');
    if (single != null) {
      final link = _parseLink(single);
      if (link != null) links.add(link);
    }
  }

  return SiteModel(
    title: info?.querySelector('.title')?.text,
    links: links,
    duration: info?.querySelector('.duration')?.text,
    thumbnail: body.querySelector('.media-result .clip img')?.attributes['src'],
  );
}

SiteModel? _parseResult(Element result) {
  final href = result.querySelector('.def-btn-box > a')?.attributes['href'];
  if (href == null || href.isEmpty) return null;

  return SiteModel(
    title: result.querySelector('.row')?.attributes['title'],
    thumbnail: result.querySelector('img')?.attributes['src'],
    links: [Link(link: href, quality: '720p', type: 'mp4')],
  );
}

List<Link> _parseLinks(List<Element> elements) {
  final links = <Link>[];
  for (final element in elements) {
    final link = _parseLink(element);
    if (link != null) links.add(link);
  }
  return links;
}

Link? _parseLink(Element element) {
  final href = element.attributes['href'];
  if (href == null || href.isEmpty) return null;

  return Link(
    quality: element.querySelector('span')?.text ?? element.text,
    link: href,
    type: element.attributes['data-type'],
  );
}
