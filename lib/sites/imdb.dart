part of direct_link;

mixin _imdb {
  static RegExp pattern = RegExp('(http://www.|https://www.)imdb.com/video/.*');

  static Future<List<SiteModel>?> get(String url) async {
    try {
      var result = <SiteModel>[];

      var host =
          'aHR0cHM6Ly9mcmVlZG93bmxvYWR2aWRlby5uZXQvd3AtanNvbi9haW8tZGwvdmlkZW8tZGF0YS8=';

      /// post data to host
      var r = await http.post(
        Uri.parse(utf8.decode(base64Url.decode(host))),
        body: {'url': url},
      );

      List medias = json.decode(r.body)['medias'];

      for (var media in medias) {
        var url = media['url'];
        var quality = media['quality'];

        result.add(SiteModel(quality: quality, link: url));
      }

      /// return result list
      return result;
    } catch (_) {
      return null;
    }
  }
}
