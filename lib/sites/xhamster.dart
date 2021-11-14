part of direct_link;

Future<List<SiteModel>> Xhamster(String url) async {
  var result = <SiteModel>[];

  /// downloader host
  var host = 'https://en.fetchfile.net/';

  /// get data from host
  var r = await http.post(
    Uri.parse(host + 'fetch/'),
    headers: {'Referer': host},
    body: {'url': url, 'action': 'homePure'},
  );

  var content = json.decode(r.body);

  List formats = content['formats'] ?? Xhamster(url);

  /// formats loop
  for (var format in formats) {
    var quality = format['format_id'].split('-')[1];
    var link = format['url'];

    /// add data to result list
    result.add(SiteModel(quality: quality, link: link));
  }

  /// return result list
  return result;
}
