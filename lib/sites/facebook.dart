part of direct_link;

mixin _facebook {
  static RegExp pattern = RegExp(
      r'^((https?:)?\/\/)?((?:www|m|fb)\.)?((((?:facebook\.com)|\.watch).*\/(video(s)?|watch|story)(\.php?|\/))|watch).+');

  static Future<List<SiteModel>?> get(String url) async {
    try {
      var result = <SiteModel>[];

      var host = 'aHR0cHM6Ly9mZG93bi5uZXQvZG93bmxvYWQucGhw';

      /// post data to host
      var r = await http.post(
        Uri.parse(utf8.decode(base64Url.decode(host))),
        body: {'URLz': url},
      );
      var body = parse(r.body);

      /// check sd included
      var sd = body.querySelector('a#sdlink');

      /// check hd included
      var hd = body.querySelector('a#hdlink');

      if (hd != null) {
        result.add(SiteModel(quality: 'hd', link: hd.attributes['href']!));
      }
      if (sd != null) {
        result.add(SiteModel(quality: 'sd', link: sd.attributes['href']!));
      }

      /// return result list
      return result;
    } catch (_) {
      return null;
    }
  }
}
