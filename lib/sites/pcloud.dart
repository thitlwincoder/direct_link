part of direct_link;

Future<List<SiteModel>> PCloud(String url) async {
  var result = <SiteModel>[];
  var parse = Parse();

  /// get data from url
  var r = await http.get(Uri.parse(url));

  /// get link
  var link = parse.tag(r.body, '\"downloadlink\": ');

  /// replace
  link = link!.replaceAll('\\/', '\/');

  /// add data to result list
  result.add(SiteModel(quality: 'url', link: link));

  /// return result list
  return result;
}
