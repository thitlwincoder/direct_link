part of direct_link;

mixin _youtube {
  static RegExp pattern = RegExp(
      '^((?:https?:)?//)?((?:www|m).)?((?:youtube.com|youtu.be))(/(?:[w-]+?v=|embed/|v/)?)([w-].+)');

  static Future<List<SiteModel>?> get(String url) async {
    var result = <SiteModel>[];

    var r = await http.get(Uri.parse(url));
    var body = r.body;
    var document = parse(body);
    var script = document.querySelectorAll('script');
    var html = script[18].innerHtml;
    html = html.replaceAll('var ytInitialPlayerResponse = ', '');
    var lastIndex = html.lastIndexOf(';');
    html = html.substring(0, lastIndex);
    var json = jsonDecode(html);

    var streamingData = json['streamingData'];
    var formats = streamingData['formats'];
    for (var data in formats) {
      result.add(
        SiteModel(
          quality: data['qualityLabel'],
          link: data['signatureCipher']?.split('url=')[1] ?? data['url'],
        ),
      );
    }

    return result;
  }
}
