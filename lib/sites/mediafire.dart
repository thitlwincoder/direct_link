part of direct_link;

Future<List<SiteModel>> Mediafire(String url) async {
  var result = <SiteModel>[];
  var parse = Parse();

  /// get data from url
  var r = await http.get(Uri.parse(url));

  /// get link
  var label = r.body.split('aria-label=\"Download file\"')[1];

  /// add data to result list
  result.add(SiteModel(quality: 'url', link: parse.tag(label, 'href=')!));

  /// return result list
  return result;
}
