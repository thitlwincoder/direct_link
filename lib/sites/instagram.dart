part of direct_link;

mixin _instagram {
  static RegExp pattern = RegExp(
      '(?:(?:http|https)://)?(?:www.)?(?:instagram.com|instagr.am|instagr.com)');

  static Future<List<SiteModel>?> get(String url) async {
    try {
      var result = <SiteModel>[];

      var host = 'aHR0cHM6Ly9pZ2Rvd25sb2FkZXIuY29tL2FqYXg=';

      var r = await http.post(
        Uri.parse(utf8.decode(base64Url.decode(host))),
        headers: {'X-Requested-With': 'XMLHttpRequest'},
        body: {'link': url, 'downloader': 'video'},
      );

      var data = json.decode(r.body);

      if (!data['error']) {
        var body = parse(data['html']);
        var href = body
            .querySelector('.row > div > div > div > a')!
            .attributes['href']!;
        result.add(SiteModel(quality: 'normal', link: href));
        return result;
      } else {
        return null;
      }
    } catch (_) {
      return null;
    }
  }
}
