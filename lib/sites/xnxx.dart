part of direct_link;

Future<List<SiteModel>> Xnxx(String url) async {
  var result = <SiteModel>[];
  var parse = Parse();

  /// downloader host
  var host = 'http://www.xnxx-downloader.net/';

  /// get data from host
  var r = await http.post(
    Uri.parse(url),
    headers: {'Referer': host},
    body: {'query': url, 'submit': ''},
  );

  /// get success
  var success = r.body.split('alert alert-success')[1];

  /// get link
  var href = parse.tag(success, 'href=')!;

  /// add data to result list
  result.add(SiteModel(quality: 'url', link: href));

  /// return result list
  return result;
}
