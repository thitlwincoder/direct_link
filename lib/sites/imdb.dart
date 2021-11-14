part of direct_link;

Future<List<SiteModel>> IMDB(String url) async {
  var result = <SiteModel>[];

  var host = 'https://freedownloadvideo.net/wp-json/aio-dl/video-data/';

  var r = await http.post(Uri.parse(host), body: {'url': url});

  List medias = json.decode(r.body)['medias'];

  for (var media in medias) {
    var url = media['url'];
    var quality = media['quality'];

    result.add(SiteModel(quality: quality, link: url));
  }

  return result;
}
