part of direct_link;

Future<List<SiteModel>> Youtube(String url) async {
  var result = <SiteModel>[];

  /// get data from url
  var r = await http.get(Uri.parse(url));

  /// get content
  var content = r.body.replaceAll('\\\"', '\"');

  /// content replace
  content = content.replaceAll('\\\\', '');
  content = content.replaceAll('\\\/', '/');
  content = content.replaceAll('\"\"', '\"');
  content = content.replaceAll('\\\\u0026', '&');
  content = content.replaceAll('codecs=\"', 'codecs=');

  /// get start index
  var start = content.indexOf('\"streamingData\":');

  /// get end index
  var end = content.indexOf(',\"playbackTracking\"');

  /// transform to json
  content = '{' + content.substring(start, end) + '}';

  /// json decode
  var data = json.decode(content.toString());

  /// get data
  data = data['streamingData'];

  for (var item in data['formats']) {
    /// get url
    var url = 'url';

    if (item['qualityLabel'] != null || item[url] != null) {
      /// add data to result list
      result.add(SiteModel(quality: item['qualityLabel'], link: item[url]));
    }
  }

  /// return result list
  return result;
}
