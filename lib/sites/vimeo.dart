part of direct_link;

mixin _vimeo {
  static RegExp pattern = RegExp('((?:https?:)?//)?(vimeo).+');

  static Future<List<SiteModel>?> get(String url) async {
    var result = <SiteModel>[];

    try {
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
      result.sort((a, b) => _quality(b).compareTo(_quality(a)));

      /// return result list
      return result;
    } catch (_) {
      return null;
    }
  }

  static _quality(SiteModel model) {
    return int.parse(model.quality.substring(0, model.quality.length - 1));
  }
}
