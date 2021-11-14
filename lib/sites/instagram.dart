part of direct_link;

Future<List<SiteModel>> Instagram(String url) async {
  var result = <SiteModel>[];

  var host = 'https://snapinsta.app';

  var r = await http.post(
    Uri.parse('$host/action.php'),
    body: {'url': url, 'action': 'post'},
  );

  var body = parse(r.body).body;

  if (body != null) {
    var href = body
        .getElementsByClassName('download-items__btn')
        .first
        .getElementsByTagName('a')
        .first
        .attributes['href'];

    if (href != null) {
      result.add(SiteModel(quality: 'auto', link: '$host$href'));
    }
  }
  return result;
}
