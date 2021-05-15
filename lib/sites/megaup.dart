part of direct_link;

Future<List<SiteModel>> Megaup(String url) async {
  var result = <SiteModel>[];
  var parse = Parse();

  /// get data from url
  var r = await http.get(Uri.parse(url));

  /// get function
  var function = r.body.split('function display()')[1];

  /// get link
  var link = parse.tag(function, 'href=')!;

  /// add data to result list
  result.add(SiteModel(quality: 'url', link: link));

  /// return result list
  return result;
}
