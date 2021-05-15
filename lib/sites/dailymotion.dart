part of direct_link;

Future<List<SiteModel>> DailyMotion(String url) async {
  var result = <SiteModel>[];
  String id;

  /// url format check
  var matches = Exp().dm.allMatches(url);
  var match = matches.elementAt(0);

  /// get id
  if (match.group(6) != null) {
    id = match.group(6)!;
  } else if (match.group(4) != null) {
    id = match.group(4)!;
  } else {
    id = match.group(2)!;
  }

  /// get data from url
  var r =
      await http.get(Uri.parse('https://www.dailymotion.com/embed/video/$id'));

  /// get config
  var config = r.body.split('__PLAYER_CONFIG__ =')[1].split(';</script>')[0];

  /// json decode
  var data = json.decode(config);

  /// get qualities
  Map<String, dynamic> qualities = data['metadata']['qualities'];

  qualities.forEach((key, value) {
    value.forEach((_value) {
      /// add data to result list
      result.add(SiteModel(quality: 'url', link: _value['url']));
    });
  });

  /// return result list
  return result;
}
