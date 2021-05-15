part of direct_link;

Future<List<SiteModel>> Vimeo(String url) async {
  var result = <SiteModel>[];
  var parse = Parse();

  /// get data from url
  var r = await http.get(Uri.parse(url));

  /// get html data
  var html = r.body.split('clip_page_config = ')[1].split('}};')[0] + '}}';

  /// json decode
  var data = json.decode(html);

  /// get config
  var config = data['player']['config_url'];

  /// get data from config url
  r = await http.get(Uri.parse('$config'));

  /// json decode
  data = json.decode(r.body);

  /// get progressive
  var progressive = data['request']['files']['progressive'];

  /// list for each
  progressive.forEach((_progressive) {
    /// get quality
    var quality = _progressive['quality'];

    /// get link
    var link = _progressive['url'];

    /// add data to result list
    result.add(SiteModel(quality: '$quality', link: '$link'));
  });

  /// result list sort by quality
  result.sort((a, b) => parse.quality(a).compareTo(parse.quality(b)));

  /// return result list
  return result;
}
