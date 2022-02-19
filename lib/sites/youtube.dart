part of direct_link;

mixin _youtube {
  static RegExp pattern = RegExp(
      '^((?:https?:)?//)?((?:www|m).)?((?:youtube.com|youtu.be))(/(?:[w-]+?v=|embed/|v/)?)([w-].+)');

  static Future<List<SiteModel>?> get(String url) async {
    var result = <SiteModel>[];
    var host =
        'aHR0cHM6Ly9hcGkub25saW5ldmlkZW9jb252ZXJ0ZXIucHJvL2FwaS9jb252ZXJ0';
    try {
      var r = await http.post(
        Uri.parse(utf8.decode(base64Url.decode(host))),
        body: {'url': url},
      );

      var j = json.decode(r.body);

      var list = j['url'];
      for (var data in list) {
        var url = data['url'];
        var type = data['attr']['title'];
        var noAudio = data['no_audio'];
        if (!noAudio) {
          result.add(SiteModel(quality: type, link: url));
        }
      }
      return result;
    } catch (_) {
      return null;
    }
  }
}
